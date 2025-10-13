import 'package:collection/collection.dart';
import 'package:dartway_core_serverpod_client/dartway_core_serverpod_client.dart'
    as dartway;
import 'package:flutter/foundation.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as auth;
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

class DwCore {
  static late final dartway.Caller endpointCaller;

  static late final SessionManager serverpodSessionManager;

  // static DwBackendFilter prepareUserProfileFilter(int serverpodUserInfoId) =>
  //     DwBackendFilter<int>.value(
  //       type: DwBackendFilterType.equals,
  //       fieldName: 'userId',
  //       fieldValue: serverpodUserInfoId,
  //     );

  static void registerSignedInUser(
    List<dartway.DwModelWrapper> wrappedModels,
  ) async {
    try {
      final authResponse =
          wrappedModels
                  .firstWhereOrNull(
                    (wrapper) => wrapper.model is auth.AuthenticationResponse,
                  )
                  ?.model
              as auth.AuthenticationResponse?;

      if (authResponse != null &&
          authResponse.success &&
          authResponse.userInfo != null &&
          authResponse.keyId != null &&
          authResponse.key != null) {
        await DwCore.serverpodSessionManager.registerSignedInUser(
          authResponse.userInfo!,
          authResponse.keyId!,
          authResponse.key!,
        );
      }
    } catch (e, st) {
      if (kDebugMode) debugPrint('processAuth error: $e\n$st');
    }
  }
}
