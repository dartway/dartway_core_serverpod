import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:dartway_core_serverpod_shared/dartway_core_serverpod_shared.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

final userInfoDefaultCrudConfig = DwCrudConfig<UserInfo>(
  table: UserInfo.t,
  getOneCustomConfigs: [
    DwGetOneConfig<UserInfo>(
      filterPrototype: DwBackendFilter.equalsPrototype(
        fieldName: DwCoreConst.userIdentifierColumnName,
      ),
    ),
  ],
);
