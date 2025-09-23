import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension RefEntityAccessExtension on Ref {
  /// Subscribes to the entity state.
  /// May return `null` if the entity is not found.
  Future<T?> watchMaybeModel<T extends SerializableModel>({
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
    return watch(DwRepository.singleEntityProvider<T>()(cfg).future);
  }

  /// Subscribes to the entity state.
  /// Throws [StateError] if the entity is not found.
  Future<T> watchModel<T extends SerializableModel>({
    int? id,
    DwBackendFilter? filter,
    String? apiGroupOverride,
    T? initialModel,
  }) async {
    final res = await watchMaybeModel<T>(
      id: id,
      filter: filter,
      apiGroupOverride: apiGroupOverride,
      initialModel: initialModel,
    );
    if (res == null) {
      throw StateError(
        'watchModel<$T>: entity not found '
        '(id=$id, filter=$filter, apiGroup=$apiGroupOverride)',
      );
    }
    return res;
  }

  /// Performs a one-time fetch from the backend.
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

  /// Performs a one-time fetch from the backend.
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
