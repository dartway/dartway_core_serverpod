import 'package:dartway_core_serverpod_client/dartway_core_serverpod_client.dart';
import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DwEntityListState<Entity extends SerializableModel>
    extends FamilyAsyncNotifier<List<Entity>, DwEntityListStateConfig>
// implements EntityManagerInterface<Entity>
{
  late int _nextPage;

  @override
  Future<List<Entity>> build(DwEntityListStateConfig config) async {
    ref.onDispose(
      () => DwRepository.removeUpdatesListener<Entity>(
        config.customUpdatesListener ?? _updatesListener,
      ),
    );

    _nextPage = 0;

    debugPrint("Building state for ${DwRepository.typeName<Entity>()}");

    final data = await _loadData();

    DwRepository.addUpdatesListener<Entity>(
      config.customUpdatesListener ?? _updatesListener,
    );

    return _processData(data).toList();
  }

  void loadNextPage() async {
    await future.then((currentState) async {
      final data = await _loadData();

      state = AsyncValue.data(<Entity>[...currentState, ..._processData(data)]);
    });
  }

  _processData(List<DwModelWrapper> data) => data.map((e) => e.model as Entity);

  Future<List<DwModelWrapper>> _loadData() async {
    final result = await DwCore.endpointCaller.dwCrud
        .getAll(
          className: DwRepository.typeName<Entity>(),
          filter: arg.backendFilter,
          limit: arg.pageSize,
          offset: arg.pageSize != null ? _nextPage++ : null,
        )
        .then(
          (response) => ref.processApiResponse<List<DwModelWrapper>>(
            response,
            updateListeners: false,
          ),
        );

    if (result == null) return <DwModelWrapper>[];

    ref.updateRepository(result, updateListeners: false);

    return result;
  }

  void _updatesListener(List<DwModelWrapper> wrappedModelUpdates) async {
    final ids = wrappedModelUpdates.map((e) => e.modelId).toSet();

    return await future.then((value) async {
      state = AsyncValue.data([
        ...wrappedModelUpdates
            .where((e) => !e.isDeleted)
            .map((e) => e.model as Entity),
        ...value.where((e) => !ids.contains((e as dynamic).id)),
      ]);
    });
  }

  // void manualInsert(int modelId, Entity model) async {
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
  //   Entity model, {
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
  //           className: Entity.toString(), modelId: modelId,
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
