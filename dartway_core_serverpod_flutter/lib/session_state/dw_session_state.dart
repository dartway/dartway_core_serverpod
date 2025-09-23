import 'dart:async';

import 'package:dartway_core_serverpod_client/dartway_core_serverpod_client.dart';
import 'package:dartway_core_serverpod_flutter/core/dw_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as auth;
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

part 'dw_session_state.freezed.dart';
part 'dw_session_state.g.dart';

@freezed
class DwSessionStateModel with _$DwSessionStateModel {
  const factory DwSessionStateModel({
    required int? signedInUserInfoId,
    // required DwBackendFilter? userProfileBackendFilter,
  }) = _DwSessionStateModel;
}

@Riverpod(keepAlive: true)
class DwSessionState extends _$DwSessionState {
  // late final Function(int? userId)? _signedInUserIdPreloadProcessing;

  @override
  DwSessionStateModel build() {
    return DwSessionStateModel(
      signedInUserInfoId: null,
      // userProfileBackendFilter: null,
    );
  }

  Future<bool> signOut({bool allDevices = false}) async {
    return allDevices
        ? await DwCore.serverpodSessionManager.signOutAllDevices()
        : await DwCore.serverpodSessionManager.signOutDevice();
  }

  _refresh() async {
    if (DwCore.serverpodSessionManager.signedInUser?.id !=
        state.signedInUserInfoId) {
      state = DwSessionStateModel(
        signedInUserInfoId: DwCore.serverpodSessionManager.signedInUser?.id,
        // await _processUserInfoId(
        //   DwCore.serverpodSessionManager.signedInUser?.id,
        // ),
        // userProfileBackendFilter:
        //     DwCore.serverpodSessionManager.signedInUser?.id == null
        //         ? null
        //         : DwCore.prepareUserProfileFilter(
        //           DwCore.serverpodSessionManager.signedInUser!.id!,
        //         ),
      );
    }
  }

  Future<bool> init({
    required auth.Caller authModuleCaller,
    // Function(int? userId)? signedInUserIdPreloadProcessing,
  }) async {
    DwCore.serverpodSessionManager = SessionManager(caller: authModuleCaller);
    // _signedInUserIdPreloadProcessing = signedInUserIdPreloadProcessing;

    if (!await DwCore.serverpodSessionManager.initialize()) return false;

    state = state.copyWith(
      signedInUserInfoId: DwCore.serverpodSessionManager.signedInUser?.id,
      //  await _processUserInfoId(
      //   DwCore.serverpodSessionManager.signedInUser?.id,
      // ),
      // userProfileBackendFilter:
      //     DwCore.serverpodSessionManager.signedInUser?.id == null
      //         ? null
      //         : DwCore.prepareUserProfileFilter(
      //           DwCore.serverpodSessionManager.signedInUser!.id!,
      //         ),
    );

    DwCore.serverpodSessionManager.addListener(_refresh);

    return true;
  }

  // Future<int?> _processUserInfoId(int? serverpodUserInfoId) async =>
  //     _signedInUserIdPreloadProcessing == null
  //         ? serverpodUserInfoId
  //         : await _signedInUserIdPreloadProcessing.call(
  //           DwCore.serverpodSessionManager.signedInUser?.id,
  //         );
}
