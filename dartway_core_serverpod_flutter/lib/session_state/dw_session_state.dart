import 'dart:async';

import 'package:dartway_core_serverpod_flutter/core/dw_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_client/module.dart' as auth;
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

part 'dw_session_state.freezed.dart';
part 'dw_session_state.g.dart';

@freezed
class DwSessionStateModel with _$DwSessionStateModel {
  const factory DwSessionStateModel({required int? signedInUserId}) =
      _DwSessionStateModel;
}

@Riverpod(keepAlive: true)
class DwSessionState extends _$DwSessionState {
  late final Function(int? userId)? _signedInUserIdPreloadProcessing;

  @override
  DwSessionStateModel build() {
    return DwSessionStateModel(signedInUserId: null);
  }

  Future<bool> signOut() async {
    return await DwCore.serverpodSessionManager.signOut();
  }

  _refresh() async {
    if (DwCore.serverpodSessionManager.signedInUser?.id !=
        state.signedInUserId) {
      state = DwSessionStateModel(
        signedInUserId: await _processUserInfoId(
          DwCore.serverpodSessionManager.signedInUser?.id,
        ),
      );
    }
  }

  Future<bool> init({
    required auth.Caller authModuleCaller,
    Function(int? userId)? signedInUserIdPreloadProcessing,
  }) async {
    DwCore.serverpodSessionManager = SessionManager(caller: authModuleCaller);
    _signedInUserIdPreloadProcessing = signedInUserIdPreloadProcessing;

    if (!await DwCore.serverpodSessionManager.initialize()) return false;

    state = state.copyWith(
      signedInUserId: await _processUserInfoId(
        DwCore.serverpodSessionManager.signedInUser?.id,
      ), // ,
    );

    DwCore.serverpodSessionManager.addListener(_refresh);

    return true;
  }

  Future<int?> _processUserInfoId(int? serverpodUserInfoId) async =>
      _signedInUserIdPreloadProcessing == null
          ? serverpodUserInfoId
          : await _signedInUserIdPreloadProcessing.call(
            DwCore.serverpodSessionManager.signedInUser?.id,
          );
}
