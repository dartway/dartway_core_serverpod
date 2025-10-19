import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/dw_core.dart';

class DwModelListState<Model extends SerializableModel>
    extends FamilyAsyncNotifier<List<Model>, DwModelListStateConfig<Model>>
// implements ModelManagerInterface<Model>
{
  late int _nextPage;

  @override
  Future<List<Model>> build(DwModelListStateConfig config) async {
    ref.onDispose(
      () => DwRepository.removeUpdatesListener<Model>(
        config.customUpdatesListener ?? _updatesListener,
      ),
    );

    _nextPage = 0;

    final globalTimestamp = ref.watch(
      DwRepository.globalRefreshTriggerProvider,
    );

    debugPrint(
      "Building state for ${DwRepository.typeName<Model>()} with timestamp $globalTimestamp",
    );

    final data = await _loadData();

    DwRepository.addUpdatesListener<Model>(
      config.customUpdatesListener ?? _updatesListener,
    );

    return _processData(data).toList();
  }

  Future<bool> loadNextPage() async {
    return await future.then((currentState) async {
      final data = await _loadData();

      state = AsyncValue.data(<Model>[...currentState, ..._processData(data)]);

      return data.length == arg.pageSize;
    });
  }

  _processData(List<DwModelWrapper> data) => data.map((e) => e.model as Model);

  Future<List<DwModelWrapper>> _loadData() async {
    final result = await DwCore.instance.endpointCaller.dwCrud
        .getAll(
          className: DwRepository.typeName<Model>(),
          filter: arg.backendFilter,
          limit: arg.pageSize,
          offset: arg.pageSize != null ? _nextPage++ : null,
        )
        .then(
          (response) => ref.processApiResponse<List<DwModelWrapper>>(
            response,
            // updateListeners: false,
          ),
        );

    if (result == null) return <DwModelWrapper>[];

    // ref.updateRepository(result, updateListeners: false);

    return result;
  }

  void _updatesListener(List<DwModelWrapper> wrappedModelUpdates) async {
    final ids = wrappedModelUpdates.map((e) => e.modelId).toSet();

    return await future.then((value) async {
      state = AsyncValue.data([
        ...wrappedModelUpdates
            .where((e) => !e.isDeleted)
            .map((e) => e.model as Model),
        ...value.where((e) => !ids.contains((e as dynamic).id)),
      ]);
    });
  }

  // void manualInsert(int modelId, Model model) async {
  //   return await future.then((value) async {
  //     ref.manualUpdate(modelId, model);

  //     state = AsyncValue.data(
  //       [
  //         modelId,
  //         ...value.whereNot((e) => e == modelId),
  //       ],
  //     );
  //   });
  // }

  // @override
  // Future<int?> save(
  //   Model model, {
  //   bool andRemoveFromList = false,
  // }) async {
  //   return await future.then(
  //     (value) async => await nitToolsCaller!.nitCrud
  //         .saveModel(
  //           wrappedModel: ObjectWrapper.wrap(model: model),
  //         )
  //         .then((response) => ref.processApiResponse<int>(response))
  //         .then(
  //       (res) {
  //         if (res == null) return null;

  //         state = AsyncValue.data([
  //           if (!andRemoveFromList) res,
  //           ...value.whereNot((e) => e == res)
  //         ]);
  //         debugPrint("Updated value = ${state.value}");
  //         return res;
  //       },
  //     ),
  //   );
  // }

  // @override
  // Future<bool> delete(int modelId) async {
  //   return await future.then(
  //     (value) async => await nitToolsCaller!.nitCrud
  //         .delete(
  //           // TODO: Изменить, toString() не работает на Web release из-за minification
  //           className: Model.toString(), modelId: modelId,
  //         )
  //         .then((response) => ref.processApiResponse<bool>(response))
  //         .then(
  //       (res) {
  //         if (res == true) {
  //           state = AsyncValue.data([...value.whereNot((e) => e == modelId)]);
  //           debugPrint("Updated value = ${state.value}");
  //         }
  //         return res ?? false;
  //       },
  //     ),
  //   );
  // }
}
