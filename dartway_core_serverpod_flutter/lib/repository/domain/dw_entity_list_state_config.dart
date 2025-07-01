import 'package:dartway_app/dartway_app.dart';
import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DwEntityListStateConfig<Entity extends SerializableModel>
    implements DwInfiniteListViewConfig<Entity> {
  final DwBackendFilter? backendFilter;
  final int? pageSize;
  final Function(List<DwModelWrapper>)? customUpdatesListener;

  const DwEntityListStateConfig({
    this.backendFilter,
    this.pageSize,
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
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DwEntityListStateConfig<Entity> &&
          runtimeType == other.runtimeType &&
          backendFilter == other.backendFilter &&
          pageSize == other.pageSize &&
          customUpdatesListener == other.customUpdatesListener;

  @override
  int get hashCode =>
      backendFilter.hashCode ^
      pageSize.hashCode ^
      customUpdatesListener.hashCode;

  DwEntityListStateConfig<Entity> copyWith({
    DwBackendFilter? backendFilter,
    int? pageSize,
    Function(List<DwModelWrapper>)? customUpdatesListener,
  }) {
    return DwEntityListStateConfig<Entity>(
      backendFilter: backendFilter ?? this.backendFilter,
      pageSize: pageSize ?? this.pageSize,
      customUpdatesListener:
          customUpdatesListener ?? this.customUpdatesListener,
    );
  }
}
