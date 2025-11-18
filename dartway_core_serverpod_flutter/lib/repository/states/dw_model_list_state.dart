import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
import 'package:dartway_core_serverpod_flutter/private/dw_singleton.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DwModelListState<Model extends SerializableModel>
    extends FamilyAsyncNotifier<List<Model>, DwModelListStateConfig<Model>>
// implements ModelManagerInterface<Model>
{
  late int _nextPage;

  @override
  Future<List<Model>> build(DwModelListStateConfig config) async {
    ref.onDispose(() {
      DwRepository.removeUpdatesListener<Model>(
        config.customUpdatesListener ?? _updatesListener,
      );
      for (var relationConfig in config.relationUpdatesConfigs ?? []) {
        relationConfig.removeUpdatesListener();
      }
    });

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

    if (config.relationUpdatesConfigs != null) {
      for (var relationConfig in config.relationUpdatesConfigs!) {
        (relationConfig as DwRelationUpdatesConfig<Model, SerializableModel>)
            .addUpdatesListener(_relationUpdatesListener);
      }
    }

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
    final result = await dw.endpointCaller.dwCrud
        .getAll(
          className: DwRepository.typeName<Model>(),
          filter: arg.backendFilter,
          limit: arg.pageSize,
          offset: arg.pageSize != null ? (_nextPage++ * arg.pageSize!) : null,
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

  void _relationUpdatesListener(
    List<DwModelWrapper> wrappedModelUpdates,
    String relationKey,
    Model Function(Model parentModel, List<DwModelWrapper> relatedModels)
    copyWithRelatedModels,
  ) async {
    return await future.then((value) async {
      state = AsyncValue.data(
        value.map((model) {
          final relatedModels =
              wrappedModelUpdates
                  .where(
                    (e) => e.foreignKeys[relationKey] == (model as dynamic).id,
                  )
                  .toList();

          return copyWithRelatedModels(model, relatedModels);
        }).toList(),
      );
    });
  }
}
