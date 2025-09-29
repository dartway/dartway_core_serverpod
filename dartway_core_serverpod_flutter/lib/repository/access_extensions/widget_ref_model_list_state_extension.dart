import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

_filter<T>(T? model, bool Function(T model) filter) =>
    model != null ? filter(model) : false;

extension WidgetRefModelListStateExtensions on WidgetRef {
  AsyncValue<List<T>> watchModelList<T extends SerializableModel>({
    DwBackendFilter? backendFilter,
    int? pageSize,
    String? apiGroupOverride,
    dynamic Function(List<DwModelWrapper>)? customUpdatesListener,
    bool Function(T model)? frontendFilter,
  }) {
    final asyncData = watch(
      DwRepository.modelListStateProvider<T>()(
        DwModelListStateConfig<T>(
          backendFilter: backendFilter,
          pageSize: pageSize,
          apiGroupOverride: apiGroupOverride,
          customUpdatesListener: customUpdatesListener,
        ),
      ),
    );

    return asyncData.whenData(
      (data) =>
          frontendFilter == null
              ? data
              : data.where((e) => _filter(e, frontendFilter)).toList(),
    );
  }

  loadNextPageForCustomizedModelListMore<T extends SerializableModel>({
    required DwModelListStateConfig config,
  }) =>
      read(
        DwRepository.modelListStateProvider<T>()(config).notifier,
      ).loadNextPage();
}
