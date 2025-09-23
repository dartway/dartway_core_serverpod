import 'package:collection/collection.dart';
import 'package:dartway_core_serverpod_client/dartway_core_serverpod_client.dart'
    as dartway;
import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
import 'package:dartway_core_serverpod_flutter/socket_state/dw_socket_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as auth;

import '../session_state/dw_session_state.dart';

enum UserIdMode { userProfileId, userInfoId }

extension DwCoreSetupExtension on WidgetRef {
  Future<bool>
  initDartwayServerpodApp<UserProfileClass extends SerializableModel>({
    required ServerpodClientShared client,
    required Function() initRepositoryFunction,

    /// very specific parameter - avoid changing without good knowledge
    UserIdMode userIdMode = UserIdMode.userProfileId,
    // List<NitRepositoryDescriptor>? customRepositoryDescriptors,
    // NitAuthConfig? nitAuthConfig,
  }) async {
    final dartwayCaller = client.moduleLookup.values.firstWhereOrNull(
      (e) => e is dartway.Caller,
    );

    final authCaller = client.moduleLookup.values.firstWhereOrNull(
      (e) => e is auth.Caller,
    );

    if (dartwayCaller == null || authCaller == null) {
      throw Exception(
        'Dartway Core module not enabled, can not init app. Add dartway_core_serverpod module to the client',
      );
    }

    DwCore.endpointCaller = dartwayCaller as dartway.Caller;
    DwCoreServerpodClient.protocol = client.serializationManager;

    await initRepositoryFunction();
    DwRepository.setupRepository(
      defaultModel: auth.UserInfo(
        id: DwRepository.mockModelId,
        userIdentifier: 'Dartway',
        created: DateTime.now(),
        scopeNames: [],
        blocked: false,
      ),
    );

    await read(
      dwSessionStateProvider.notifier,
    ).init(authModuleCaller: authCaller as auth.Caller);

    return read(dwSocketStateProvider.notifier).init(client: client);
  }
}
