import 'package:dartway_app/dartway_app.dart';
import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DwModelListStateConfig<Model extends SerializableModel>
    implements DwInfiniteListViewConfig<Model> {
  final DwBackendFilter? backendFilter;
  final int? pageSize;
  final String? apiGroupOverride;
  final Function(List<DwModelWrapper>)? customUpdatesListener;

  const DwModelListStateConfig({
    this.backendFilter,
    this.pageSize,
    this.apiGroupOverride,
    this.customUpdatesListener,
  });

  @override
  Future<bool> loadNextPage(WidgetRef ref) {
    return ref
        .read(DwRepository.modelListStateProvider<Model>()(this).notifier)
        .loadNextPage();
  }

  @override
  AsyncValue<List<Model>> watchAsyncValue(WidgetRef ref) {
    return ref.watchModelListCustomizedAsync<Model>(config: this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is DwModelListStateConfig<Model> &&
            backendFilter == other.backendFilter &&
            pageSize == other.pageSize &&
            apiGroupOverride == other.apiGroupOverride &&
            customUpdatesListener == other.customUpdatesListener;
  }

  @override
  int get hashCode =>
      backendFilter.hashCode ^
      pageSize.hashCode ^
      apiGroupOverride.hashCode ^
      customUpdatesListener.hashCode;

  DwModelListStateConfig<Model> copyWith({
    DwBackendFilter? backendFilter,
    int? pageSize,
    String? apiGroupOverride,
    Function(List<DwModelWrapper>)? customUpdatesListener,
  }) {
    return DwModelListStateConfig<Model>(
      backendFilter: backendFilter ?? this.backendFilter,
      pageSize: pageSize ?? this.pageSize,
      apiGroupOverride: apiGroupOverride ?? this.apiGroupOverride,
      customUpdatesListener:
          customUpdatesListener ?? this.customUpdatesListener,
    );
  }

  @override
  String toString() {
    return 'DwModelListStateConfig<$Model>('
        'backendFilter: $backendFilter, '
        'pageSize: $pageSize, '
        'apiGroupOverride: $apiGroupOverride, '
        'customUpdatesListener: $customUpdatesListener'
        ')';
  }
}
