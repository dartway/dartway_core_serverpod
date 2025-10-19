import 'package:collection/collection.dart';
import 'package:dartway_core_serverpod_client/dartway_core_serverpod_client.dart'
    as dartway;
import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../session_state/dw_session_state.dart';
import '../session_state/dw_session_state_model.dart';

class DwCore<UserProfileClass extends SerializableModel> {
  DwCore._({
    required this.client,
    required this.sessionProvider,
    required this.endpointCaller,
    required this.getUserId,
  });

  final ServerpodClientShared client;

  final StateNotifierProvider<
    DwSessionStateNotifier<UserProfileClass>,
    DwSessionStateModel<UserProfileClass>
  >?
  sessionProvider;

  final dartway.Caller endpointCaller;

  /// Функция, которая достаёт id из UserProfile.
  final int? Function(UserProfileClass? user) getUserId;

  static DwCore? _instance;

  static DwCore get instance {
    final instance = _instance;
    if (instance == null) {
      throw StateError('DwCore is not initialized. Call DwCore.init() first.');
    }
    return instance;
  }

  static Future<DwCore<UserProfileClass>>
  init<UserProfileClass extends SerializableModel>({
    required ServerpodClientShared client,
    required WidgetRef ref,
    required Function() initRepositoryFunction,
    required int? Function(UserProfileClass? user) getUserId,
  }) async {
    // --- ищем dartway endpoint ---
    final dartwayCaller = client.moduleLookup.values.firstWhereOrNull(
      (e) => e is dartway.Caller,
    );

    if (dartwayCaller == null) {
      throw Exception(
        'DartWay Core module not found. '
        'Add dartway_core_serverpod module to the client.',
      );
    }

    DwCoreServerpodClient.protocol = client.serializationManager;
    await initRepositoryFunction();
    DwRepository.setupRepository(
      defaultModel: DwAuthKey(
        id: DwRepository.mockModelId,
        userId: DwRepository.mockModelId,
        key: 'mockKey',
        hash: 'mockHash',
      ),
    );
    DwRepository.setupRepository(
      defaultModel: DwAuthData(
        userProfile: DwRepository.getDefault<UserProfileClass>(),
        userId: DwRepository.mockModelId,
        key: 'mockKey',
        keyId: DwRepository.mockModelId,
      ),
    );

    final sessionProvider =
        (client.authenticationKeyManager == null)
            ? null
            : StateNotifierProvider<
              DwSessionStateNotifier<UserProfileClass>,
              DwSessionStateModel<UserProfileClass>
            >(
              (ref) => DwSessionStateNotifier<UserProfileClass>(
                ref,
                client.authenticationKeyManager as DwAuthenticationKeyManager,
              ),
            );

    if (sessionProvider != null) {
      await ref.read(sessionProvider.notifier).initialize();
    }

    // --- создаём и сохраняем экземпляр ---
    final core = DwCore<UserProfileClass>._(
      client: client,
      sessionProvider: sessionProvider,
      endpointCaller: dartwayCaller as dartway.Caller,
      getUserId: getUserId,
    );
    _instance = core;

    if (kDebugMode) {
      debugPrint('[DwCore] initialized for $UserProfileClass');
    }

    return core;
  }
}
