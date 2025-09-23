import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension WidgetRefEntityAccessExtension on WidgetRef {
  /// Watches the entity as an AsyncValue.
  /// May contain `null` if the entity is not found.
  AsyncValue<T?> watchMaybeModel<T extends SerializableModel>({
    int? id,
    DwBackendFilter? filter,
    String? apiGroupOverride,
    T? initialModel,
  }) {
    final cfg = DwSingleEntityStateConfig<T>(
      id: id,
      filter: filter,
      apiGroupOverride: apiGroupOverride,
      initialModel: initialModel,
    );
    return watch(DwRepository.singleEntityProvider<T>()(cfg));
  }

  /// Watches the entity as an AsyncValue.
  /// Throws [StateError] if the entity resolves to null.
  AsyncValue<T> watchModel<T extends SerializableModel>({
    int? id,
    DwBackendFilter? filter,
    String? apiGroupOverride,
    T? initialModel,
  }) {
    return watchMaybeModel<T>(
      id: id,
      filter: filter,
      apiGroupOverride: apiGroupOverride,
      initialModel: initialModel,
    ).whenData((res) {
      if (res == null) {
        throw StateError(
          'watchModel<$T>: entity not found '
          '(id=$id, filter=$filter, apiGroup=$apiGroupOverride)',
        );
      }
      return res;
    });
  }

  /// One-time read from state or backend.
  /// May return `null` if the entity is not found.
  Future<T?> readMaybeModel<T extends SerializableModel>({
    int? id,
    DwBackendFilter? filter,
    String? apiGroupOverride,
    T? initialModel,
    bool forceFetch = false,
  }) {
    final cfg = DwSingleEntityStateConfig<T>(
      id: id,
      filter: filter,
      apiGroupOverride: apiGroupOverride,
      initialModel: initialModel,
    );
    final notifier = read(DwRepository.singleEntityProvider<T>()(cfg).notifier);
    return notifier.read(forceFetch: forceFetch);
  }

  /// One-time read from state or backend.
  /// Throws [StateError] if the entity is not found.
  Future<T> readModel<T extends SerializableModel>({
    int? id,
    DwBackendFilter? filter,
    String? apiGroupOverride,
    T? initialModel,
    bool forceFetch = false,
  }) async {
    final res = await readMaybeModel<T>(
      id: id,
      filter: filter,
      apiGroupOverride: apiGroupOverride,
      initialModel: initialModel,
      forceFetch: forceFetch,
    );
    if (res == null) {
      throw StateError(
        'readModel<$T>: entity not found '
        '(id=$id, filter=$filter, apiGroup=$apiGroupOverride)',
      );
    }
    return res;
  }
}
