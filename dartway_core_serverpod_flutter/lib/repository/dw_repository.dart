// export 'descriptor/repository_descriptor.dart';
// export 'state/nit_repository_state.dart';

import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
import 'package:dartway_core_serverpod_flutter/repository/states/dw_entity_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'states/dw_single_entity_state.dart';

class DwRepository {
  static const int mockModelId = 0;

  static final Map<Type, String> _typeNamesMapping = {};

  static final Map<String, List<Function(List<DwModelWrapper>)>>
  _updateListeners = {};

  static String typeName<T extends SerializableModel>() =>
      _typeNamesMapping[T]!;

  static String? maybeTypeName<T>() => _typeNamesMapping[T];

  static final defaultObjectsRepository = <String, dynamic>{};

  static setupRepository<T extends SerializableModel>({
    required T defaultModel,
  }) {
    _typeNamesMapping[T] =
        DwCoreServerpodClient.protocol
            .getClassNameForObject(defaultModel)!
            .split('.')
            .last;
    defaultObjectsRepository[typeName<T>()] = defaultModel;
  }

  static provideNonModelDefaultValue<T>({required T nonModelObject}) {
    assert(nonModelObject is! SerializableModel);
    return defaultObjectsRepository[T.toString()] = nonModelObject;
  }

  static T getDefault<T>() {
    final t = defaultObjectsRepository[maybeTypeName<T>() ?? T.toString()];
    if (t == null) {
      throw UnimplementedError(
        "Default Objects Repository doesn't contain a model of type $T",
      );
    }
    return t as T;
  }

  static addUpdatesListener<T extends SerializableModel>(
    Function(List<DwModelWrapper> wrappedModelUpdates) listener,
  ) {
    if (_updateListeners[DwRepository.typeName<T>()] == null) {
      _updateListeners[DwRepository.typeName<T>()] = [];
    }
    _updateListeners[DwRepository.typeName<T>()]!.add(listener);
  }

  static removeUpdatesListener<T extends SerializableModel>(
    Function(List<DwModelWrapper> wrappedModel) listener,
  ) {
    if (_updateListeners[DwRepository.typeName<T>()] != null) {
      _updateListeners[DwRepository.typeName<T>()]!.remove(listener);
    }
  }

  static updateListeningStates({
    required List<DwModelWrapper> wrappedModelUpdates,
  }) {
    final updateMap = <String, List<DwModelWrapper>>{};

    for (var wrappedModel in wrappedModelUpdates) {
      if (updateMap[wrappedModel.nitMappingClassname] == null) {
        updateMap[wrappedModel.nitMappingClassname] = [wrappedModel];
      } else {
        updateMap[wrappedModel.nitMappingClassname]!.add(wrappedModel);
      }
    }

    for (var className in updateMap.keys) {
      debugPrint(
        'Updating Listening States for $className with ${updateMap[className]!.length} objects. Active listeners: ${_updateListeners.keys}.',
      );
      for (var listener in _updateListeners[className] ?? []) {
        listener(updateMap[className]);
      }
    }
  }

  static final _entityListStateProviders =
      <
        Type,
        AsyncNotifierProviderFamily<
          DwEntityListState,
          List<dynamic>,
          DwEntityListStateConfig
        >
      >{};

  static AsyncNotifierProviderFamily<
    DwEntityListState<T>,
    List<T>,
    DwEntityListStateConfig
  >
  entityListStateProvider<T extends SerializableModel>() {
    if (_entityListStateProviders[T] == null) {
      _entityListStateProviders[T] = AsyncNotifierProviderFamily<
        DwEntityListState<T>,
        List<T>,
        DwEntityListStateConfig
      >(DwEntityListState<T>.new);
    }

    return _entityListStateProviders[T]
        as AsyncNotifierProviderFamily<
          DwEntityListState<T>,
          List<T>,
          DwEntityListStateConfig
        >;
  }

  static final _singleEntityStateProviders =
      <
        Type,
        AsyncNotifierProviderFamily<
          DwSingleEntityState,
          dynamic,
          DwSingleEntityStateConfig
        >
      >{};

  static AsyncNotifierProviderFamily<
    DwSingleEntityState<T>,
    T?,
    DwSingleEntityStateConfig
  >
  singleEntityProvider<T extends SerializableModel>() {
    if (_singleEntityStateProviders[T] == null) {
      _singleEntityStateProviders[T] = AsyncNotifierProviderFamily<
        DwSingleEntityState<T>,
        T?,
        DwSingleEntityStateConfig
      >(DwSingleEntityState<T>.new);
    }

    return _singleEntityStateProviders[T]
        as AsyncNotifierProviderFamily<
          DwSingleEntityState<T>,
          T?,
          DwSingleEntityStateConfig
        >;
  }
}
