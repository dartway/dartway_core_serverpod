import 'package:dartway_app/dartway_app.dart';
import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DwEntityListStateConfig<Entity extends SerializableModel>
    implements DwInfiniteListViewConfig<Entity> {
  final DwBackendFilter? backendFilter;
  final int? pageSize;
  final String? apiGroupOverride;
  final Function(List<DwModelWrapper>)? customUpdatesListener;

  const DwEntityListStateConfig({
    this.backendFilter,
    this.pageSize,
    this.apiGroupOverride,
    this.customUpdatesListener,
  });

  @override
  Future<bool> loadNextPage(WidgetRef ref) {
    return ref
        .read(DwRepository.entityListStateProvider<Entity>()(this).notifier)
        .loadNextPage();
  }

  @override
  AsyncValue<List<Entity>> watchAsyncValue(WidgetRef ref) {
    return ref.watchEntityListCustomizedAsync<Entity>(config: this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is DwEntityListStateConfig<Entity> &&
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

  DwEntityListStateConfig<Entity> copyWith({
    DwBackendFilter? backendFilter,
    int? pageSize,
    String? apiGroupOverride,
    Function(List<DwModelWrapper>)? customUpdatesListener,
  }) {
    return DwEntityListStateConfig<Entity>(
      backendFilter: backendFilter ?? this.backendFilter,
      pageSize: pageSize ?? this.pageSize,
      apiGroupOverride: apiGroupOverride ?? this.apiGroupOverride,
      customUpdatesListener:
          customUpdatesListener ?? this.customUpdatesListener,
    );
  }

  @override
  String toString() {
    return 'DwEntityListStateConfig<$Entity>('
        'backendFilter: $backendFilter, '
        'pageSize: $pageSize, '
        'apiGroupOverride: $apiGroupOverride, '
        'customUpdatesListener: $customUpdatesListener'
        ')';
  }
}
