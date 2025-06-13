import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension RefWatchAndReadExtension on Ref {
  static _defaultConfig(int id) => DwSingleEntityStateConfig(
    backendFilter: DwBackendFilter<int>.value(
      type: DwBackendFilterType.equals,
      fieldName: 'id',
      fieldValue: id,
    ),
  );

  Future<T> watchModel<T extends SerializableModel>(int id) async {
    return await watch(
      DwRepository.singleEntityProvider<T>()(_defaultConfig(id)).future,
    ).then((res) => res!);
  }

  Future<T> readModel<T extends SerializableModel>(int id) async {
    return await read(
      DwRepository.singleEntityProvider<T>()(_defaultConfig(id)).future,
    ).then((res) => res!);
  }

  AsyncValue<T> watchModelAsync<T extends SerializableModel>(int id) {
    return watch(
      DwRepository.singleEntityProvider<T>()(_defaultConfig(id)),
    ).whenData((res) => res!);
  }

  Future<T> readModelCustom<T extends SerializableModel>({
    required DwBackendFilter backendFilter,
  }) async => (await readMaybeModelCustom<T>(backendFilter: backendFilter))!;

  Future<T?> readMaybeModelCustom<T extends SerializableModel>({
    required DwBackendFilter backendFilter,
  }) async => read(
    DwRepository.singleEntityProvider<T>()(
          DwSingleEntityStateConfig(backendFilter: backendFilter),
        )
        .future,
  );

  Future<T> watchModelCustom<T extends SerializableModel>({
    required DwBackendFilter backendFilter,
  }) async => (await watchMaybeModelCustom<T>(backendFilter: backendFilter))!;

  Future<T?> watchMaybeModelCustom<T extends SerializableModel>({
    required DwBackendFilter backendFilter,
  }) async => watch(
    DwRepository.singleEntityProvider<T>()(
          DwSingleEntityStateConfig(backendFilter: backendFilter),
        )
        .future,
  );

  AsyncValue<T> watchModelCustomAsync<T extends SerializableModel>({
    required DwBackendFilter backendFilter,
  }) => watchMaybeModelCustomAsync<T>(
    backendFilter: backendFilter,
  ).whenData((res) => res!);

  AsyncValue<T?> watchMaybeModelCustomAsync<T extends SerializableModel>({
    required DwBackendFilter backendFilter,
  }) => watch(
    DwRepository.singleEntityProvider<T>()(
      DwSingleEntityStateConfig(backendFilter: backendFilter),
    ),
  );
}
