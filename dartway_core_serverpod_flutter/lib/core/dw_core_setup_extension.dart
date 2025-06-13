import 'package:collection/collection.dart';
import 'package:dartway_core_serverpod_client/dartway_core_serverpod_client.dart'
    as dartway;
import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
import 'package:dartway_core_serverpod_flutter/session_state/dw_session_state.dart';
import 'package:dartway_core_serverpod_flutter/socket_state/dw_socket_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as auth;

enum UserIdMode { userProfileId, userInfoId }

extension DwCoreSetupExtension on WidgetRef {
  Future<bool>
  initDartwayServerpodApp<UserProfileClass extends SerializableModel>({
    required ServerpodClientShared client,
    required Function() initRepositoryFunction,
    UserIdMode userIdMode = UserIdMode.userInfoId,
    // List<NitRepositoryDescriptor>? customRepositoryDescriptors,
    // NitAuthConfig? nitAuthConfig,
  }) async {
    final dartwayCaller = client.moduleLookup.values.firstWhereOrNull(
      (e) => e is dartway.Caller,
    );

    if (dartwayCaller != null) {
      DwCore.endpointCaller = dartwayCaller as dartway.Caller;
    }

    final authCaller = client.moduleLookup.values.firstWhereOrNull(
      (e) => e is auth.Caller,
    );

    if (authCaller == null) {
      throw Exception(
        'Auth module not enabled, can not init session. Add serverpod_auth module to the client',
      );
    }

    // if (authCaller != null) {
    //   authModuleCaller = authCaller as auth.Caller;
    // }

    // authModuleCaller = client!.moduleLookup.values
    //     .firstWhereOrNull((e) => e is auth.Caller) as auth.Caller;

    // final chatsCaller = client!.moduleLookup.values
    //     .firstWhereOrNull((e) => e is chats.Caller);

    // if (chatsCaller != null) {
    //   chatsModuleCaller = chatsCaller as chats.Caller;
    // }
    // chatsModuleCaller = client!.moduleLookup.values
    //     .firstWhereOrNull((e) => e is chats.Caller) as chats.Caller;

    DwCoreServerpodClient.protocol = client.serializationManager;

    await initRepositoryFunction();

    // for (var repo
    //     in customRepositoryDescriptors ?? <NitRepositoryDescriptor>[]) {
    //   repo.init();
    // }

    await read(dwSessionStateProvider.notifier).init(
      authModuleCaller: authCaller as auth.Caller,
      signedInUserIdPreloadProcessing: (serverpodUserInfoId) async {
        if (serverpodUserInfoId != null) {
          // final profile = await DwCore.endpointCaller.dwCrud
          //     .getOne(
          //       className: 'UserProfile',
          //       filter: DwBackendFilter<int>.value(
          //         type: DwBackendFilterType.equals,
          //         fieldName: 'userId',
          //         fieldValue: serverpodUserInfoId,
          //       ),
          //     )
          //     .then((response) => processApiResponse<DwModelWrapper>(response));

          final userProfile = await readModelCustom<UserProfileClass>(
            backendFilter: DwCore.prepareUserProfileFilter(serverpodUserInfoId),
          );

          // final t = read(
          //   DwRepository.singleEntityProvider<UserProfileClass>()(
          //         DwSingleEntityStateConfig(
          //           backendFilter: DwBackendFilter<int>.value(
          //             type: DwBackendFilterType.equals,
          //             fieldName: 'id',
          //             fieldValue: serverpodUserInfoId,
          //           ),
          //         ),
          //       )
          //       .notifier,
          // );

          // final p2 = await readModel<UserProfileClass>((p as dynamic).id);

          return userIdMode == UserIdMode.userProfileId
              ? (userProfile as dynamic).id
              : serverpodUserInfoId;
        }
        return null;
      },
    );

    // if (nitAuthConfig != null) NitAuthConfig.config = nitAuthConfig;

    return read(dwSocketStateProvider.notifier).init(client: client);
  }
}
