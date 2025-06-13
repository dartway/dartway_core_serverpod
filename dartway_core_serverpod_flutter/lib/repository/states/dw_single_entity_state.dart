import 'package:collection/collection.dart';
import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DwSingleEntityState<Entity extends SerializableModel>
    extends FamilyAsyncNotifier<Entity?, DwSingleEntityStateConfig> {
  @override
  Future<Entity?> build(DwSingleEntityStateConfig config) async {
    ref.onDispose(
      () => DwRepository.removeUpdatesListener<Entity>(
        // config.customUpdatesListener ??
        _updatesListener,
      ),
    );

    debugPrint(
      "Getting single ${DwRepository.typeName<Entity>()} with id $arg",
    );

    final res = await DwCore.endpointCaller.dwCrud
        .getOne(
          className: DwRepository.typeName<Entity>(),
          filter: arg.backendFilter,
        )
        .then((response) => ref.processApiResponse<DwModelWrapper>(response));

    DwRepository.addUpdatesListener<Entity>(
      // config.customUpdatesListener ??
      _updatesListener,
    );

    return res == null ? null : res.model as Entity;
  }

  void _updatesListener(List<DwModelWrapper> wrappedModelUpdates) async {
    return await future.then((currentState) async {
      if (currentState == null) return;

      final match = wrappedModelUpdates.firstWhereOrNull(
        (e) => e.modelId == (currentState as dynamic).id,
      );

      if (match != null) {
        debugPrint(
          "Updating singleState ${DwRepository.typeName<Entity>()} with id $arg",
        );
        state = AsyncValue.data(match.isDeleted ? null : match.model as Entity);
      }
    });
  }
}
