import 'package:dartway_core_serverpod_shared/dartway_core_serverpod_shared.dart';

class DwTelegramAlertsConfig {
  late final String alertsChatId;
  late final String alertsToken;
  late final String? alertsMessageThreadId;

  DwTelegramAlertsConfig({
    required this.alertsChatId,
    required this.alertsToken,
    required this.alertsMessageThreadId,
  });

  static DwTelegramAlertsConfig? fromEnv({required Map<String, String> env}) {
    if (env[DwCoreConst.dwTelegramAlertsChatIdKey] == null ||
        env[DwCoreConst.dwTelegramAlertsChatIdKey]!.isEmpty ||
        env[DwCoreConst.dwTelegramAlertsTokenKey] == null ||
        env[DwCoreConst.dwTelegramAlertsTokenKey]!.isEmpty) {
      // TODO: заменить на log function
      print(
        'DwTelegramAlertsConfig.fromEnv: env doesn\'t contain all required keys',
      );
      return null;
    }

    return DwTelegramAlertsConfig(
      alertsChatId: env[DwCoreConst.dwTelegramAlertsChatIdKey]!,
      alertsToken: env[DwCoreConst.dwTelegramAlertsTokenKey]!,
      alertsMessageThreadId:
          env[DwCoreConst.dwTelegramAlertsMessageThreadIdKey],
    );
  }
}
