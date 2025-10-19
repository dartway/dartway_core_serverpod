import 'dart:async';

import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dw_session_state_model.dart';

StateNotifierProvider<DwSessionStateNotifier<T>, DwSessionStateModel<T>>
createDwSessionProvider<T extends SerializableModel>(
  DwAuthenticationKeyManager keyManager,
) {
  return StateNotifierProvider<
    DwSessionStateNotifier<T>,
    DwSessionStateModel<T>
  >((ref) => DwSessionStateNotifier<T>(ref, keyManager));
}

class DwSessionStateNotifier<UserProfileClass extends SerializableModel>
    extends StateNotifier<DwSessionStateModel<UserProfileClass>> {
  DwSessionStateNotifier(this.ref, this.keyManager)
    : super(
        DwSessionStateModel<UserProfileClass>(
          signedInUserProfile: null,
          signedInUserId: null,
        ),
      );

  final Ref ref;
  final DwAuthenticationKeyManager keyManager;

  Future<void> initialize() async {
    final (int? signedInUserId, UserProfileClass? signedInUserProfile) =
        await keyManager.loadLocalUserProfile<UserProfileClass>();

    state = state.copyWith(
      signedInUserProfile: signedInUserProfile,
      signedInUserId: signedInUserId,
    );

    DwRepository.addUpdatesListener<DwAuthData>(_handleAuthDataUpdates);
    DwRepository.addUpdatesListener<DwAuthKey>(_handleAuthKeyUpdates);
    DwRepository.addUpdatesListener<UserProfileClass>(
      _handleUserProfileUpdates,
    );

    // TODO: add try catch and alerting
    // throw Exception('Failed to initialize DwCore session');
  }

  /// 🧹 Dispose hook
  @override
  void dispose() {
    // Отписываемся от репозитория
    DwRepository.removeUpdatesListener<DwAuthData>(_handleAuthDataUpdates);
    DwRepository.removeUpdatesListener<DwAuthKey>(_handleAuthKeyUpdates);
    DwRepository.removeUpdatesListener<UserProfileClass>(
      _handleUserProfileUpdates,
    );

    // Можно очистить runtime ссылки
    // _storage = null; // (если бы _storage был nullable)

    if (kDebugMode) {
      debugPrint('[DwSessionStateNotifier] disposed');
    }

    super.dispose(); // обязательно вызывай super
  }

  void _handleAuthDataUpdates(List<DwModelWrapper> wrappedModelUpdates) async {
    for (var wrappedModel in wrappedModelUpdates) {
      if (wrappedModel.model is DwAuthData && !wrappedModel.isDeleted) {
        await _signIn(wrappedModel.model as DwAuthData);

        return;
      }
    }
  }

  void _handleAuthKeyUpdates(List<DwModelWrapper> wrappedModelUpdates) async {
    for (var wrappedModel in wrappedModelUpdates) {
      if (wrappedModel.model is DwAuthKey && wrappedModel.isDeleted) {
        unawaited(keyManager.remove());
        state = state.copyWith(signedInUserProfile: null, signedInUserId: null);
      }
    }
  }

  void _handleUserProfileUpdates(
    List<DwModelWrapper> wrappedModelUpdates,
  ) async {
    for (var wrappedModel in wrappedModelUpdates) {
      if (wrappedModel.model is UserProfileClass &&
          wrappedModel.modelId == state.signedInUserId) {
        state = state.copyWith(
          signedInUserProfile: wrappedModel.model as UserProfileClass,
        );
        // await _storeUserProfile(wrappedModel.model as UserProfileClass);
        return;
      }
    }
  }

  Future<void> _signIn(DwAuthData authData) async {
    final key = '${authData.keyId}:${authData.key}';

    unawaited(keyManager.put(key));
    unawaited(
      keyManager.storeUserProfile(authData.userProfile as UserProfileClass),
    );

    state = state.copyWith(
      signedInUserProfile: authData.userProfile as UserProfileClass,
      signedInUserId: authData.userId,
    );
  }

  Future<void> signOut() async {
    if (state.signedInUserId != null && state.signedInUserProfile != null) {
      final response = await DwCore.instance.endpointCaller.dwCrud.delete(
        className: 'DwAuthKey',
        modelId: keyManager.authKeyId!,
        apiGroup: DwCoreConst.dartwayInternalApi,
      );

      ref.processApiResponse<bool>(response);
    }
  }
}
