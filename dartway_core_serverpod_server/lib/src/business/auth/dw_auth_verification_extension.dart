import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:serverpod/serverpod.dart';

extension DwAuthVerificationExtension on DwAuthVerification {
  void setFailed(Session session, DwAuthFailReason reason) {
    // TODO: setup alerting
    session.log('Auth verification failed: $reason', level: LogLevel.warning);
    failReason = reason;
  }
}
