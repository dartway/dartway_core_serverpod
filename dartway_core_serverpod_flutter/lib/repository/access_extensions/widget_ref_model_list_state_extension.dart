import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

_filter<T>(T? model, bool Function(T model) filter) =>
    model != null ? filter(model) : false;

extension WidgetRefModelListStateExtensions on WidgetRef {
  Future<List<T>> watchModelList<T extends SerializableModel>({
    DwBackendFilter? backendFilter,
    bool Function(T model)? frontendFilter,
  }) async {
    final items = await watch(
      DwRepository.modelListStateProvider<T>()(
            DwModelListStateConfig<T>(backendFilter: backendFilter),
          )
          .future,
    );

    return frontendFilter == null
        ? items
        : items.where((e) => _filter(e, frontendFilter)).toList();
  }

  AsyncValue<List<T>> watchModelListAsync<T extends SerializableModel>({
    DwBackendFilter? backendFilter,
    bool Function(T model)? frontendFilter,
  }) => watch(
    DwRepository.modelListStateProvider<T>()(
      DwModelListStateConfig<T>(backendFilter: backendFilter),
    ),
  ).whenData(
    (data) =>
        frontendFilter == null
            ? data
            : data.where((e) => _filter(e, frontendFilter)).toList(),
  );

  AsyncValue<List<T>>
  watchModelListCustomizedAsync<T extends SerializableModel>({
    required DwModelListStateConfig config,
    bool Function(T model)? frontendFilter,
  }) => watch(DwRepository.modelListStateProvider<T>()(config)).whenData(
    (data) =>
        frontendFilter == null
            ? data
            : data.where((e) => _filter(e, frontendFilter)).toList(),
  );

  loadNextPageForCustomizedModelListMore<T extends SerializableModel>({
    required DwModelListStateConfig config,
  }) =>
      read(
        DwRepository.modelListStateProvider<T>()(config).notifier,
      ).loadNextPage();
}
