import 'dart:convert';

import 'package:http/http.dart' as http;

import 'dw_telegram_alerts.dart';

class DwTelegramService {
  static Future<void> sendMessage({
    required String message,
    required String chatId,
    required String token,
    String? messageThreadId,
    bool suppressErrors = false,
  }) async {
    try {
      final url = Uri.parse("https://api.telegram.org/bot$token/sendMessage");

      final body = {
        "chat_id": chatId,
        "text": message,
        if (messageThreadId != null) "message_thread_id": messageThreadId,
      };

      final res = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      if (res.statusCode != 200) {
        if (!suppressErrors) {
          DwTelegramAlerts.sendAlert(
            message:
                "⚠️ DwTelegramService: Error response ${res.statusCode}: ${res.body}",
            suppressErrors: true,
          );
        }
      }
    } catch (e) {
      if (!suppressErrors) {
        DwTelegramAlerts.sendAlert(
          message: "⚠️ DwTelegramService: Exception while sending message: $e",
          suppressErrors: true,
        );
      }
    }
  }
}
