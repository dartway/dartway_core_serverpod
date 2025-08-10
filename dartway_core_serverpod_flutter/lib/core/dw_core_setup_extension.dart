import 'package:collection/collection.dart';
import 'package:dartway_core_serverpod_client/dartway_core_serverpod_client.dart'
    as dartway;
import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
import 'package:dartway_core_serverpod_flutter/socket_state/dw_socket_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as auth;

enum UserIdMode { userProfileId, userInfoId }

extension DwCoreSetupExtension on WidgetRef {
  Future<bool>
  initDartwayServerpodApp<UserProfileClass extends SerializableModel>({
    required ServerpodClientShared client,
    required Function() initRepositoryFunction,
    UserIdMode userIdMode = UserIdMode.userProfileId,
    // List<NitRepositoryDescriptor>? customRepositoryDescriptors,
    // NitAuthConfig? nitAuthConfig,
  }) async {
    final dartwayCaller = client.moduleLookup.values.firstWhereOrNull(
      (e) => e is dartway.Caller,
    );

    if (dartwayCaller == null) {
      throw Exception(
        'Dartway Core module not enabled, can not init app. Add dartway_core_serverpod module to the client',
      );
    }

    DwCore.endpointCaller = dartwayCaller as dartway.Caller;

    final authCaller = client.moduleLookup.values.firstWhereOrNull(
      (e) => e is auth.Caller,
    );

    if (authCaller == null) {
      throw Exception(
        'Auth module not enabled, can not init session. Add dartway_auth_serverpod or serverpod_auth module to the client',
      );
    }

    DwCoreServerpodClient.protocol = client.serializationManager;

    await initRepositoryFunction();

    await read(dwSessionStateProvider.notifier).init(
      authModuleCaller: authCaller as auth.Caller,
      signedInUserIdPreloadProcessing: (serverpodUserInfoId) async {
        if (serverpodUserInfoId != null) {
          final userProfile = await readModelCustom<UserProfileClass>(
            backendFilter: DwCore.prepareUserProfileFilter(serverpodUserInfoId),
          );

          return userIdMode == UserIdMode.userProfileId
              ? (userProfile as dynamic).id
              : serverpodUserInfoId;
        }
        return null;
      },
    );

    return read(dwSocketStateProvider.notifier).init(client: client);
  }
}
