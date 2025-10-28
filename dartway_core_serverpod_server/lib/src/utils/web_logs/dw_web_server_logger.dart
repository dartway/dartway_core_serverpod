import 'dart:convert';
import 'dart:io';

import 'package:serverpod/serverpod.dart';

import '../../generated/protocol.dart';

/// Universal web request logger for Serverpod routes.
/// Handles reading the body once, error handling, and DB logging.
class DwWebServerLogger {
  /// Wraps any HTTP handler with logging and error tracking.
  ///
  /// [action] receives the already-read body (may be null for GET requests).
  ///
  /// Example:
  /// ```dart
  /// return DwWebServerLogger.handle(
  ///   session,
  ///   request,
  ///   handler: 'CreateUserRoute',
  ///   action: (body) async {
  ///     final data = jsonDecode(body ?? '{}');
  ///     ...
  ///     return true;
  ///   },
  /// );
  /// ```
  static Future<bool> handle(
    Session session,
    HttpRequest request, {
    required String handler,
    required Future<bool> Function(String? body) action,
  }) async {
    final start = DateTime.now();

    String? requestBody;
    String? status;
    String? error;
    int? statusCode;

    try {
      // --- 1. Read body only once
      if (request.method == 'POST' ||
          request.method == 'PUT' ||
          request.method == 'PATCH') {
        try {
          requestBody = await utf8.decoder.bind(request).join();
        } catch (e) {
          session.log('⚠️ Failed to read request body: $e',
              level: LogLevel.warning);
        }
      }

      // --- 2. Run main handler with body passed in
      final result = await action(requestBody);
      status = result ? 'success' : 'error';
      statusCode = request.response.statusCode;
      return result;
    } catch (e, st) {
      // --- 3. Handle exceptions
      error = e.toString();
      status = 'error';
      statusCode = HttpStatus.internalServerError;

      session.log('❌ $handler failed: $e',
          level: LogLevel.error, exception: e, stackTrace: st);

      request.response
        ..statusCode = HttpStatus.internalServerError
        ..headers.contentType = ContentType.json
        ..write(jsonEncode({'success': false, 'error': e.toString()}));

      return true;
    } finally {
      // --- 4. Collect headers
      final headersMap = <String, String>{};
      request.headers.forEach((name, values) {
        headersMap[name] = values.join(',');
      });

      // --- 5. Measure duration
      final durationMs = DateTime.now().difference(start).inMilliseconds;

      // --- 6. Write log to DB
      try {
        await DwWebServerLog.db.insertRow(
          session,
          DwWebServerLog(
            createdAt: start,
            method: request.method,
            url: request.uri.toString(),
            headers: jsonEncode(headersMap),
            body: requestBody,
            statusCode: statusCode,
            status: status,
            error: error,
            durationMs: durationMs,
            handler: handler,
            ip: request.connectionInfo?.remoteAddress.address,
          ),
        );
      } catch (e, st) {
        session.log('⚠️ Failed to write DwWebServerLog: $e',
            level: LogLevel.error, exception: e, stackTrace: st);
      }
    }
  }
}
