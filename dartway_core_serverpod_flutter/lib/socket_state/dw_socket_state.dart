import 'package:dartway_core_serverpod_client/dartway_core_serverpod_client.dart';
import 'package:dartway_core_serverpod_flutter/core/dw_core.dart';
import 'package:dartway_core_serverpod_flutter/repository/access_extensions/ref_update_actions_extension.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../session_state/dw_session_state.dart';

part 'dw_socket_state.freezed.dart';
part 'dw_socket_state.g.dart';

@freezed
abstract class DwSocketStateModel with _$DwSocketStateModel {
  const factory DwSocketStateModel({
    required StreamingConnectionStatus websocketStatus,
  }) = _DwSocketStateModel;
}

@Riverpod(keepAlive: true)
class DwSocketState extends _$DwSocketState {
  StreamingConnectionHandler? _connectionHandler;

  @override
  DwSocketStateModel build() {
    ref.listen(dwSessionStateProvider, (previousState, nextState) {
      if (nextState.signedInUserInfoId != previousState?.signedInUserInfoId
      //  &&
      //     _connectionHandler?.status.status ==
      //         StreamingConnectionStatus.connected
      ) {
        _connectionHandler?.client.closeStreamingConnection();
      }
    });

    // final sessionState = ref.watch(nitSessionStateProvider);

    return DwSocketStateModel(
      websocketStatus: StreamingConnectionStatus.disconnected,
    );
  }

  Future<bool> init({required ServerpodClientShared client}) async {
    _connectionHandler = StreamingConnectionHandler(
      client: client,
      retryEverySeconds: 1,
      listener: (connectionState) async {
        debugPrint('listener called ${connectionState.status}');
        _refresh();
      },
    );

    _connectionHandler!.connect();

    return true;
  }

  _refresh() async {
    if (state.websocketStatus != StreamingConnectionStatus.connected &&
        _connectionHandler?.status.status ==
            StreamingConnectionStatus.connected) {
      _listenToUpdates();
    }

    state = DwSocketStateModel(
      websocketStatus:
          _connectionHandler?.status.status ??
          StreamingConnectionStatus.disconnected,
    );
  }

  _proccessUpdate(DwModelWrapper update) {
    debugPrint("Received ${update.className} with id ${update.modelId}");
    // TODO: setup app notifications processing
    // if (update.model is DwAppNotification) {
    //   ref.notifyUser(update.model as DwAppNotification);
    //   // for (var enclosedObject
    //   //     in (update.model as DwAppNotification).updatedEntities ?? []) {
    //   //   ref.updateFromStream(enclosedObject);
    //   // }
    // }

    ref.updateFromStream(update);
  }

  Future<void> _listenToUpdates() async {
    DwCore.endpointCaller.dwRealTime.resetStream();

    // final t = nitToolsCaller!.nitCrud.stream.listen(onData)

    await for (var update in DwCore.endpointCaller.dwRealTime.stream) {
      if (update is DwModelWrapper) {
        _proccessUpdate(update);
      } else if (update is DwUpdatesTransport) {
        for (var e in update.wrappedModelUpdates) {
          _proccessUpdate(e);
        }
      }
    }
  }
}
