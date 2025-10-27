class DwTelegramAlertsConfig {
  final String alertsChatId;
  final String alertsToken;
  final String alertsMessageThreadId;

  const DwTelegramAlertsConfig({
    required this.alertsChatId,
    required this.alertsToken,
    required this.alertsMessageThreadId,
  });
}
