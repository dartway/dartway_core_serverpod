import 'package:dartway_core_serverpod_client/dartway_core_serverpod_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

class DwCore {
  static late final Caller endpointCaller;

  static late final SessionManager serverpodSessionManager;

  // static DwBackendFilter prepareUserProfileFilter(int serverpodUserInfoId) =>
  //     DwBackendFilter<int>.value(
  //       type: DwBackendFilterType.equals,
  //       fieldName: 'userId',
  //       fieldValue: serverpodUserInfoId,
  //     );
}
