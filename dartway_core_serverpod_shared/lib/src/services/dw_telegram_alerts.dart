import 'dart:convert';

import 'package:http/http.dart' as http;

import 'dw_telegram_alerts_config.dart';

class DwTelegramAlerts {
  static String? _alertsChatId;
  static String? _alertsToken;
  static String? _alertsMessageThreadId;

  /// Инициализация из .env
  static Future<void> init({required DwTelegramAlertsConfig config}) async {
    _alertsChatId = config.alertsChatId;
    _alertsToken = config.alertsToken;
    _alertsMessageThreadId = config.alertsMessageThreadId;
  }

  /// Отправка уведомления
  static Future<void> sendAlert({
    required String message,
    bool suppressErrors = false,
  }) async {
    if (_alertsChatId == null || _alertsToken == null) {
      // debugPrint(
      //     '⚠️ TelegramAlerts: Не настроен токен/чат, сообщение не отправлено.');
      return;
    }

    await _sendMessage(
      message: message,
      chatId: _alertsChatId!,
      token: _alertsToken!,
      messageThreadId: _alertsMessageThreadId,
      suppressErrors: suppressErrors,
    );
  }

  static Future<void> _sendMessage({
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
          sendAlert(
            message:
                "⚠️ TelegramAlerts: Ошибка ответа ${res.statusCode}: ${res.body}",
            suppressErrors: true,
          );
        }
      }
    } catch (e) {
      if (!suppressErrors) {
        sendAlert(
          message: "⚠️ TelegramAlerts: Exception while sending alert: $e",
          suppressErrors: true,
        );
      }
    }
  }
}
