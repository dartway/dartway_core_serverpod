import 'package:collection/collection.dart';
import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:serverpod/serverpod.dart';

import '../core/dw_core.dart';

class DwCrudEndpoint extends Endpoint {
  final _deepEquality = const DeepCollectionEquality();

  Future<DwApiResponse<DwModelWrapper>> getOne(
    Session session, {
    required String className,
    required DwBackendFilter filter,
    String? apiGroup,
  }) async {
    try {
      final caller = DwCore.instance.getCrudConfig(className, api: apiGroup);

      print(
        "Received getOneCustom request for $className with filter: ${filter.attributeMap}",
      );

      if (caller?.getModelConfigs == null || caller!.getModelConfigs!.isEmpty) {
        return DwApiResponse.notConfigured(source: 'получение $className');
      }

      final config = caller.getModelConfigs!.firstWhereOrNull(
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

  Future<DwApiResponse<int>> getCount(
    Session session, {
    required String className,
    DwBackendFilter? filter,
    String? apiGroup,
  }) async {
    final caller = DwCore.instance.getCrudConfig(className, api: apiGroup);

    print(
      "CRUD: getCount for $className with filter: $filter",
    );

    if (caller?.getListConfig == null) {
      return DwApiResponse.notConfigured(source: 'getCount for $className');
    }

    return await caller!.getListConfig!.getCount(
      session,
      whereClause: filter?.prepareWhere(
        caller.table,
      ),
    );
  }

  Future<DwApiResponse<List<DwModelWrapper>>> getAll(
    Session session, {
    required String className,
    DwBackendFilter? filter,
    int? limit,
    int? offset,
    String? apiGroup,
  }) async {
    final caller = DwCore.instance.getCrudConfig(className, api: apiGroup);

    if (caller?.getListConfig == null) {
      return DwApiResponse.notConfigured(source: 'получение списка $className');
    }

    return await caller!.getListConfig!.getModelList(
      session,
      whereClause: filter?.prepareWhere(caller.table),
      limit: limit,
      offset: offset,
    );
  }

  Future<DwApiResponse<DwModelWrapper>> saveModel(
    Session session, {
    required DwModelWrapper wrappedModel,
    String? apiGroup,
  }) async {
    final model = wrappedModel.object;

    if (model is! TableRow) {
      throw UnsupportedError(
        'Received item of unsupported type: ${model.runtimeType}. Only TableRow could be saved to database',
      );
    }

    final className = wrappedModel.dwMappingClassname;
    final caller =
        DwCore.instance.getCrudConfig(className, api: apiGroup)?.saveConfig;

    if (caller == null) {
      return DwApiResponse.notConfigured(source: 'сохранение $className');
    }
    return await caller.save(session, model);
  }

  Future<DwApiResponse<bool>> delete(
    Session session, {
    required String className,
    required int modelId,
    String? apiGroup,
  }) async {
    final caller =
        DwCore.instance.getCrudConfig(className, api: apiGroup)?.deleteConfig;

    if (caller == null) {
      return DwApiResponse.notConfigured(source: 'delete $className');
    }

    return await caller.delete(session, modelId);
  }
}
