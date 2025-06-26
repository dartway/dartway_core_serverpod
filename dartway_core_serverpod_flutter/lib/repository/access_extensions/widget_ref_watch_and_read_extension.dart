import 'package:dartway_core_serverpod_flutter/dartway_core_serverpod_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension WidgetRefWatchAndReadExtension on WidgetRef {
  static _defaultConfig<T extends SerializableModel>(
    int id, {
    T? initialModel,
  }) => DwSingleEntityStateConfig<T>(
    backendFilter: DwBackendFilter<int>.value(
      type: DwBackendFilterType.equals,
      fieldName: 'id',
      fieldValue: id,
    ),
    initialModel: initialModel,
  );

  Future<T> watchModel<T extends SerializableModel>(int id) async {
    return await watch(
      DwRepository.singleEntityProvider<T>()(_defaultConfig<T>(id)).future,
    ).then((res) => res!);
  }

  Future<T> readModel<T extends SerializableModel>(int id) async {
    return await read(
      DwRepository.singleEntityProvider<T>()(_defaultConfig<T>(id)).future,
    ).then((res) => res!);
  }

  AsyncValue<T> watchModelAsync<T extends SerializableModel>(
    int id, {
    T? initialModel,
  }) {
    // if (initialModel != null) {
    //   read(
    //     DwRepository.singleEntityProvider<T>()(_defaultConfig<T>(id)).notifier,
    //   ).state = AsyncData(initialModel);
    // }

    return watch(
      DwRepository.singleEntityProvider<T>()(
        _defaultConfig<T>(id, initialModel: initialModel),
      ),
    ).whenData((res) => res!);
  }

  Future<T> readModelCustom<T extends SerializableModel>({
    required DwBackendFilter backendFilter,
  }) async => (await readMaybeModelCustom<T>(backendFilter: backendFilter))!;

  Future<T?> readMaybeModelCustom<T extends SerializableModel>({
    required DwBackendFilter backendFilter,
  }) async => read(
    DwRepository.singleEntityProvider<T>()(
          DwSingleEntityStateConfig<T>(backendFilter: backendFilter),
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
          DwSingleEntityStateConfig<T>(backendFilter: backendFilter),
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
      DwSingleEntityStateConfig<T>(backendFilter: backendFilter),
    ),
  );

  // T readModel<T extends SerializableModel>(
  //   int key, [
  //   NitRepositoryDescriptor<T, int>? repositoryDescriptor,
  // ]) =>
  //     readMaybeModel<T>(key, repositoryDescriptor)!;

  // T? readMaybeModel<T extends SerializableModel>(
  //   int key, [
  //   NitRepositoryDescriptor<T, int>? repositoryDescriptor,
  // ]) =>
  //     key == NitDefaultModelsRepository.mockModelId
  //         ? NitDefaultModelsRepository.get<T>()
  //         : read(
  //             NitRepository.getModelProvider<T, int>(
  //               key,
  //               repositoryDescriptor,
  //             ),
  //           );

  // Future<T> readOrFetchModel<T extends SerializableModel>(
  //   int key, [
  //   NitRepositoryDescriptor<T, int>? repositoryDescriptor,
  // ]) async =>
  //     (await readOrFetchMaybeModel<T>(key, repositoryDescriptor))!;

  // Future<T?> readOrFetchMaybeModel<T extends SerializableModel>(
  //   int key, [
  //   NitRepositoryDescriptor<T, int>? repositoryDescriptor,
  // ]) async {
  //   T? model = readMaybeModel<T>(key, repositoryDescriptor);

  //   if (model == null) {
  //     await watch(
  //       NitRepository.getFetchProvider(key, repositoryDescriptor).future,
  //     );
  //   }
  //   return readMaybeModel<T>(
  //     key,
  //     repositoryDescriptor,
  //   );
  // }

  // T watchModel<T extends SerializableModel>(
  //   int key, [
  //   NitRepositoryDescriptor<T, int>? repositoryDescriptor,
  // ]) =>
  //     watchMaybeModel<T>(key, repositoryDescriptor)!;

  // T? watchMaybeModel<T extends SerializableModel>(
  //   int key, [
  //   NitRepositoryDescriptor<T, int>? repositoryDescriptor,
  // ]) =>
  //     key == NitDefaultModelsRepository.mockModelId
  //         ? NitDefaultModelsRepository.get<T>()
  //         : watch(
  //             NitRepository.getModelProvider<T, int>(
  //               key,
  //               repositoryDescriptor,
  //             ),
  //           );

  // Future<T> watchOrFetchModel<T extends SerializableModel>(
  //   int key, [
  //   NitRepositoryDescriptor<T, int>? repositoryDescriptor,
  // ]) async => (await watchOrFetchMaybeModel<T>(key, repositoryDescriptor))!;

  // Future<T?> watchOrFetchMaybeModel<T extends SerializableModel>(
  //   int key, [
  //   NitRepositoryDescriptor<T, int>? repositoryDescriptor,
  // ]) async {
  //   T? model = watchMaybeModel<T>(key, repositoryDescriptor);

  //   if (model == null) {
  //     await watch(
  //       DwRepository.getFetchProvider(key, repositoryDescriptor).future,
  //     );
  //   }
  //   return watchMaybeModel<T>(key, repositoryDescriptor);
  // }

  // AsyncValue<T> watchOrFetchModelAsync<T extends SerializableModel>(
  //   int key, [
  //   NitRepositoryDescriptor<T, int>? repositoryDescriptor,
  // ]) => watchOrFetchMaybeModelAsync<T>(
  //   key,
  //   repositoryDescriptor,
  // ).whenData((res) => res!);

  // AsyncValue<T?> watchOrFetchMaybeModelAsync<T extends SerializableModel>(
  //   int key, [
  //   NitRepositoryDescriptor<T, int>? repositoryDescriptor,
  // ]) {
  //   T? model = watchMaybeModel<T>(key, repositoryDescriptor);

  //   return model != null
  //       ? AsyncData(model)
  //       : watch(
  //         NitRepository.getFetchProvider(key, repositoryDescriptor),
  //       ).whenData((_) => watchMaybeModel<T>(key, repositoryDescriptor));
  // }

  // Future<T> watchModelCustom<T extends SerializableModel>({
  //   required DwBackendFilter backendFilter,
  // }) async => (await watchMaybeModelCustom<T>(backendFilter: backendFilter))!;

  // Future<T?> DwMaybeModelCustom<T extends SerializableModel>({
  //   required NitBackendFilter backendFilter,
  // }) async => watch(
  //   singleItemCustomProvider<T>()(
  //         SingleItemCustomProviderConfig(backendFilter: backendFilter),
  //       )
  //       .future,
  // ).then((value) => value == null ? null : watchModel<T>(value));

  // Future<T> readModelCustom<T extends SerializableModel>({
  //   required NitBackendFilter backendFilter,
  // }) async => (await readMaybeModelCustom<T>(backendFilter: backendFilter))!;

  // Future<T?> readMaybeModelCustom<T extends SerializableModel>({
  //   required NitBackendFilter backendFilter,
  // }) async => watch(
  //   singleItemCustomProvider<T>()(
  //         SingleItemCustomProviderConfig(backendFilter: backendFilter),
  //       )
  //       .future,
  // ).then((value) => value == null ? null : readModel<T>(value));
}
