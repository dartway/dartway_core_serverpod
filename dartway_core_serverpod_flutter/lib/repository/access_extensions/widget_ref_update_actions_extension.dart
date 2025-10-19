import 'package:dartway_core_serverpod_client/dartway_core_serverpod_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/dw_core.dart';
import '../dw_repository.dart';

extension WidgetRefUpdateActionsExtension on WidgetRef {
  Future<Model> saveModel<Model extends SerializableModel>(
    Model model, {
    String? apiGroupOverride,
  }) async {
    return await DwCore.instance.endpointCaller.dwCrud
        .saveModel(
          wrappedModel: DwModelWrapper.wrap(model: model),
          apiGroup: apiGroupOverride,
        )
        .then((response) => processApiResponse<DwModelWrapper>(response))
        .then((res) => res!.model as Model);
  }

  // Future<DwModelWrapper?> saveModel<T extends SerializableModel>(
  //   T model,
  // ) async {
  //   return saveModels([model]).then((ids) => ids?.first);
  // }

  // Future<List<DwModelWrapper>?> saveModels(
  //   List<SerializableModel> models,
  // ) async {
  //   return await DwCore.endpointCaller.dwCrud
  //       .saveModels(
  //         wrappedModels:
  //             models.map((model) => DwModelWrapper.wrap(model: model)).toList(),
  //       )
  //       .then((response) => processApiResponse<List<DwModelWrapper>>(response));
  // }

  Future<bool> deleteModel<T extends SerializableModel>(
    T model, {
    String? apiGroupOverride,
  }) async {
    // TODO: подумать, как сделать это получше, может апи поменять или засылать objectWrapper.deleted просто

    final modelId = model.toJson()['id'];
    if (modelId == null) {
      // notifyUser(NitNotification.warning(
      //   'Мое',
      // ));
      return true;
    }
    return await DwCore.instance.endpointCaller.dwCrud
        .delete(
          className: DwModelWrapper.getClassNameForObject(model),
          modelId: modelId,
          apiGroup: apiGroupOverride,
        )
        .then((response) => processApiResponse<bool>(response) ?? false);
  }

  updateRepository(
    List<DwModelWrapper> wrappedModels,
    // {
    // bool updateListeners = true,
    // }
  ) {
    // for (var wrapper in wrappedModels) {
    //   // for (var repo in NitRepository.getAllModelProviders(wrapper)) {
    //   //   read(repo.notifier).state = wrapper.isDeleted ? null : wrapper.model;
    //   // }

    // }
    // if (updateListeners) {
    DwRepository.updateListeningStates(wrappedModelUpdates: wrappedModels);
    // }
  }

  K? processApiResponse<K>(
    DwApiResponse<K> response,
    // {
    // bool updateListeners = true,
    // }
  ) {
    debugPrint(response.toJson().toString());
    // TODO: setup user notifications
    // if (response.error != null || response.warning != null) {
    //   notifyUser(
    //     response.error != null
    //         ? NitNotification.error(response.error!)
    //         : NitNotification.warning(response.warning!),
    //   );
    // }

    if ((response.updatedModels ?? []).isNotEmpty) {
      updateRepository(
        response.updatedModels ?? [],
        // updateListeners: updateListeners,
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
