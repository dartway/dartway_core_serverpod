import 'package:dartway_core_serverpod_client/dartway_core_serverpod_client.dart';
import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

_filter<T>(T? model, bool Function(T model) filter) =>
    model != null ? filter(model) : false;

extension WidgetRefEntityListStateExtensions on WidgetRef {
  Future<List<T>> watchEntityList<T extends SerializableModel>({
    DwBackendFilter? backendFilter,
    bool Function(T model)? frontendFilter,
  }) async {
    final items = await watch(
      DwRepository.entityListStateProvider<T>()(
            DwEntityListStateConfig(backendFilter: backendFilter),
          )
          .future,
    );

    return frontendFilter == null
        ? items
        : items.where((e) => _filter(e, frontendFilter)).toList();
  }

  AsyncValue<List<T>> watchEntityListAsync<T extends SerializableModel>({
    DwBackendFilter? backendFilter,
    bool Function(T model)? frontendFilter,
  }) => watch(
    DwRepository.entityListStateProvider<T>()(
      DwEntityListStateConfig(backendFilter: backendFilter),
    ),
  ).whenData(
    (data) =>
        frontendFilter == null
            ? data
            : data.where((e) => _filter(e, frontendFilter)).toList(),
  );

  AsyncValue<List<T>>
  watchEntityListCustomizedAsync<T extends SerializableModel>({
    required DwEntityListStateConfig config,
    bool Function(T model)? frontendFilter,
  }) => watch(DwRepository.entityListStateProvider<T>()(config)).whenData(
    (data) =>
        frontendFilter == null
            ? data
            : data.where((e) => _filter(e, frontendFilter)).toList(),
  );

  loadNextPageForCustomizedEntityListMore<T extends SerializableModel>({
    required DwEntityListStateConfig config,
  }) =>
      read(
        DwRepository.entityListStateProvider<T>()(config).notifier,
      ).loadNextPage();
}
