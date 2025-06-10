import 'package:dartway_core_serverpod_client/dartway_core_serverpod_client.dart';
import 'package:dartway_core_serverpod_flutter/core/dw_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dw_repository.dart';

extension RefUpdateActionsExtension on Ref {
  Future<DwModelWrapper?> saveModel<T extends SerializableModel>(
    T model,
  ) async {
    return saveModels([model]).then((ids) => ids?.first);
  }

  Future<List<DwModelWrapper>?> saveModels(
    List<SerializableModel> models,
  ) async {
    return await DwCore.endpointCaller.dwCrud
        .saveModels(
          wrappedModels:
              models.map((model) => DwModelWrapper.wrap(model: model)).toList(),
        )
        .then((response) => processApiResponse<List<DwModelWrapper>>(response));
  }

  Future<bool> deleteModel<T extends SerializableModel>(T model) async {
    // TODO: подумать, как сделать это получше, может апи поменять или засылать objectWrapper.deleted просто

    final modelId = model.toJson()['id'];
    if (modelId == null) {
      // notifyUser(NitNotification.warning(
      //   'Мое',
      // ));
      return true;
    }
    return await DwCore.endpointCaller.dwCrud
        .delete(
          className: DwModelWrapper.getClassNameForObject(model),
          modelId: modelId,
        )
        .then((response) => processApiResponse<bool>(response) ?? false);
  }

  updateRepository(
    List<DwModelWrapper> wrappedModels, {
    bool updateListeners = true,
  }) {
    for (var wrapper in wrappedModels) {
      // for (var repo in NitRepository.getAllModelProviders(wrapper)) {
      //   read(repo.notifier).state = wrapper.isDeleted ? null : wrapper.model;
      // }

      if (updateListeners) {
        DwRepository.updateListeningStates(wrappedModel: wrapper);
      }
    }
  }

  K? processApiResponse<K>(
    DwApiResponse<K> response, {
    bool updateListeners = true,
  }) {
    debugPrint(response.toJson().toString());
    // TODO: setup user notifications
    // if (response.error != null || response.warning != null) {
    //   notifyUser(
    //     response.error != null
    //         ? NitNotification.error(response.error!)
    //         : NitNotification.warning(response.warning!),
    //   );
    // }

    if ((response.updatedEntities ?? []).isNotEmpty) {
      updateRepository(
        response.updatedEntities ?? [],
        updateListeners: updateListeners,
      );
    }
    return response.value;
  }

  updateFromStream(DwModelWrapper update) {
    if (update.modelId != null) {
      updateRepository([update]);
    }
  }
}
