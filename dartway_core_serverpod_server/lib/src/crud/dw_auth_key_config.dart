import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';

final dwAuthKeyConfig = DwCrudConfig<DwAuthKey>(
  table: DwAuthKey.t,
  deleteConfig: DwDeleteConfig(
    allowDelete: (session, model) => session.isUser(model.userId),
  ),
);
