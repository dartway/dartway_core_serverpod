import 'package:collection/collection.dart';
import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DwSingleEntityState<Entity extends SerializableModel>
    extends FamilyAsyncNotifier<Entity?, DwSingleEntityStateConfig<Entity>> {
  @override
  Future<Entity?> build(DwSingleEntityStateConfig<Entity> config) async {
    ref.onDispose(
      () => DwRepository.removeUpdatesListener<Entity>(_updatesListener),
    );

    final globalTimestamp = ref.watch(
      DwRepository.globalRefreshTriggerProvider,
    );

    debugPrint(
      "Getting single ${DwRepository.typeName<Entity>()} "
      "with filter ${config.backendFilter} "
      "and timestamp $globalTimestamp",
    );

    final res =
        config.initialModel != null
            ? null
            : await DwCore.endpointCaller.dwCrud
                .getOne(
                  className: DwRepository.typeName<Entity>(),
                  filter: config.backendFilter,
                  apiGroup: config.apiGroupOverride,
                )
                .then(
                  (response) =>
                      ref.processApiResponse<DwModelWrapper>(response),
                );

    DwRepository.addUpdatesListener<Entity>(_updatesListener);

    return config.initialModel != null
        ? config.initialModel as Entity
        : (res == null ? null : res.model as Entity);
  }

  /// Reads the entity either from state or from backend.
  /// - Awaits the current `future` if already loading.
  /// - If `forceFetch = false` → return cached/loaded value.
  /// - If `forceFetch = true` → always fetch fresh from backend.
  Future<Entity?> read({bool forceFetch = false}) async {
    if (!forceFetch) {
      // this will wait for loading if needed
      final current = await future;
      if (current != null) {
        return current;
      }
    }

    // always fetch from backend when forced or no cached value
    final res = await DwCore.endpointCaller.dwCrud
        .getOne(
          className: DwRepository.typeName<Entity>(),
          filter: arg.backendFilter,
          apiGroup: arg.apiGroupOverride,
        )
        .then((response) => ref.processApiResponse<DwModelWrapper>(response));

    final model = res?.model as Entity?;
    state = AsyncValue.data(model);
    return model;
  }

  void _updatesListener(List<DwModelWrapper> wrappedModelUpdates) async {
    return await future.then((currentState) async {
      if (currentState == null) return;

      final match = wrappedModelUpdates.firstWhereOrNull(
        (e) => e.modelId == (currentState as dynamic).id,
      );

      if (match != null) {
        debugPrint(
          "Updating singleState ${DwRepository.typeName<Entity>()} "
          "with id ${(currentState as dynamic).id}",
        );
        state = AsyncValue.data(match.isDeleted ? null : match.model as Entity);
      }
    });
  }
}
