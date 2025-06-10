import 'package:collection/collection.dart';
import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:serverpod/serverpod.dart';

class DwCrudEndpoint extends Endpoint {
  // Future<DwApiResponse<int>> getOneById(
  //   Session session, {
  //   required String className,
  //   required int id,
  // }) async {
  //   final caller = CrudConfig.getCaller(className);

  //   if (caller?.getOneById == null) {
  //     return DwApiResponse.notConfigured(source: 'получение $className по id');
  //   }
  //   return await caller!.getOneById!.call(
  //     session,
  //     id,
  //   );
  // }

  final _deepEquality = const DeepCollectionEquality();
  // final MapEquality _mapEquality = const MapEquality();

  Future<DwApiResponse<int>> getOneCustom(
    Session session, {
    required String className,
    required DwBackendFilter filter,
  }) async {
    try {
      final caller = DwCrudConfig.getCaller(className);

      print(
        "Received getOneCustom request for $className with filter: ${filter.attributeMap}",
      );

      if (caller?.getOneCustomConfigs == null ||
          caller!.getOneCustomConfigs!.isEmpty) {
        return DwApiResponse.notConfigured(source: 'получение $className');
      }

      // for (var t in caller.getOneCustomConfigs ?? []) {
      //   final k = t.filterPrototype.attributeMap;
      //   print(k);
      // }

      // final d = filter.attributeMap;
      // print(d);

      final config = caller.getOneCustomConfigs!.firstWhereOrNull(
        (e) => _deepEquality.equals(
          e.filterPrototype.attributeMap,
          filter.attributeMap,
        ),
      );

      if (config == null) {
        return DwApiResponse.notConfigured(source: 'получение $className');
      }

      return await config.call(session, caller.table, filter);
    } catch (ex) {
      print(ex);
      print(StackTrace.current);
      return DwApiResponse(
        isOk: false,
        value: null,
        error:
            'Непредвиденная ошибка при обработке запроса на получение $className',
      );
    }
  }

  // Future<DwApiResponse<List<int>>> getAll(
  //   Session session, {
  //   required String className,
  //   DwBackendFilter? filter,
  //   int? limit,
  //   int? offset,
  // }) async {
  //   final caller = DwCrudConfig.getCaller(className);

  //   print(
  //     "Received getAll request for $className ${filter != null ? 'with filter: ${filter.attributeMap}' : ''}",
  //   );

  //   if (caller?.getAll == null) {
  //     return DwApiResponse.notConfigured(source: 'получение списка $className');
  //   }

  //   return await caller!.getAll!.getIds(
  //     session,
  //     whereClause: filter?.prepareWhere(caller.table),
  //     limit: limit,
  //     offset: offset,
  //   );
  // }

  Future<DwApiResponse<List<DwModelWrapper>>> getAll(
    Session session, {
    required String className,
    DwBackendFilter? filter,
    int? limit,
    int? offset,
  }) async {
    final caller = DwCrudConfig.getCaller(className);

    if (caller?.getAll == null) {
      return DwApiResponse.notConfigured(source: 'получение списка $className');
    }

    return await caller!.getAll!.getEntityList(
      session,
      whereClause: filter?.prepareWhere(caller.table),
      limit: limit,
      offset: offset,
    );
  }

  Future<DwApiResponse<List<DwModelWrapper>>> saveModels(
    Session session, {
    required List<DwModelWrapper> wrappedModels,
  }) async {
    final res = DwApiResponse<List<DwModelWrapper>>(
      isOk: true,
      value: [],
      updatedEntities: [],
    );
    for (DwModelWrapper model in wrappedModels) {
      final t = await saveModel(session, wrappedModel: model);

      if (t.isOk && t.value != null) {
        res.value!.add(t.value!);
        res.updatedEntities!.addAll(t.updatedEntities ?? []);
      } else {
        return DwApiResponse(
          isOk: false,
          value: null,
          error: t.error,
          warning: t.warning,
        );
      }
    }

    return res;
  }

  Future<DwApiResponse<DwModelWrapper>> saveModel(
    Session session, {
    required DwModelWrapper wrappedModel,
  }) async {
    final model = wrappedModel.object;

    if (model is! TableRow) {
      throw UnsupportedError(
        'Received item of unsupported type: ${model.runtimeType}. Only TableRow could be saved to database',
      );
    }

    final className = wrappedModel.dwMappingClassname;
    final caller = DwCrudConfig.getCaller(className)?.post;

    if (caller == null) {
      return DwApiResponse.notConfigured(source: 'сохранение $className');
    }
    return await caller.upsert(session, model);
  }

  Future<DwApiResponse<bool>> delete(
    Session session, {
    required String className,
    required int modelId,
    // required ObjectWrapper wrappedModel,
  }) async {
    final caller = DwCrudConfig.getCaller(className)?.post;

    if (caller == null) {
      return DwApiResponse.notConfigured(source: 'удаление $className');
    }

    return await caller.delete(session, modelId);
  }
}
