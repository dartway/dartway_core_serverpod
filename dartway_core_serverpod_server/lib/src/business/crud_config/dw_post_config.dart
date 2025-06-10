import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:serverpod/serverpod.dart';

class DwPostConfig<T extends TableRow> {
  const DwPostConfig({
    this.allowInsert,
    this.allowUpdate,
    this.allowDelete,
    this.beforeInsert,
    this.beforeUpdate,
    this.afterInsert,
    this.afterUpdate,
    this.afterDelete,
  });

  const DwPostConfig.simple({
    required Future<bool> Function(Session session, T model) allowAllActions,
    this.beforeInsert,
    this.beforeUpdate,
    this.afterInsert,
    this.afterUpdate,
    this.afterDelete,
  })  : allowInsert = allowAllActions,
        allowUpdate = allowAllActions,
        allowDelete = allowAllActions;

  final Future<bool> Function(Session session, T model)? allowInsert;
  final Future<bool> Function(Session session, T model)? allowUpdate;
  final Future<bool> Function(Session session, T model)? allowDelete;

  final Future<T> Function(Session session, T newModel)? beforeInsert;
  final Future<T> Function(Session session, T currentModel, T newModel)?
      beforeUpdate;

  final Future<List<TableRow>> Function(Session session, T insertedModel)?
      afterInsert;
  final Future<List<TableRow>> Function(
      Session session, T initialModel, T updatedModel)? afterUpdate;
  final Future<List<TableRow>> Function(Session session, T model)? afterDelete;

  Future<DwApiResponse<DwModelWrapper>> upsert(Session session, T model) async {
    final isInsert = model.id == null;
    if (null == (isInsert ? allowInsert : allowUpdate)) {
      return DwApiResponse.notConfigured(source: 'обновление $T');
    }

    if (true !=
        await (isInsert ? allowInsert : allowUpdate)?.call(session, model)) {
      return DwApiResponse.forbidden();
    }

    final initialModel =
        (isInsert || (afterUpdate == null && beforeUpdate == null))
            ? null
            : await session.db.findById<T>(model.id!);

    final updatedModel = isInsert
        ? await session.db.insertRow<T>(
            beforeInsert == null ? model : await beforeInsert!(session, model))
        : await session.db.updateRow<T>(
            beforeUpdate == null
                ? model
                : await beforeUpdate!(
                    session,
                    initialModel!,
                    model,
                  ),
          );

    final results = <TableRow>[updatedModel];

    if (isInsert && afterInsert != null) {
      results.addAll(
        await afterInsert!(
          session,
          updatedModel,
        ),
      );
    }

    if (!isInsert && afterUpdate != null) {
      results.addAll(
        await afterUpdate!(
          session,
          initialModel!,
          updatedModel,
        ),
      );
    }

    return DwApiResponse(
      isOk: true,
      value: DwModelWrapper(object: updatedModel),
      updatedEntities: results
          .map(
            (e) => DwModelWrapper(object: e),
          )
          .toList(),
    );
  }

  Future<DwApiResponse<bool>> delete(Session session, int modelId) async {
    final T? model = await session.db.findById<T>(modelId);

    if (model == null) {
      return DwApiResponse(
        isOk: true,
        value: true,
        warning: 'Объект не найден, возможно, удален ранее',
      );
    }

    if (allowDelete == null) {
      return DwApiResponse.notConfigured(source: 'удаление $T');
    }

    if (true != await allowDelete?.call(session, model)) {
      return DwApiResponse.forbidden();
    }

    try {
      await session.db.deleteRow(model);
    } on DatabaseException {
      return DwApiResponse(
        isOk: false,
        value: false,
        error:
            'Невозможно удалить объект, к которому привязаны другие сущности',
      );
    }

    return DwApiResponse(
      isOk: true,
      value: true,
      updatedEntities: [
        DwModelWrapper.deleted(object: model),
        if (afterDelete != null)
          ...(await (afterDelete!(session, model))).map(
            (e) => DwModelWrapper(object: e),
          ),
      ],
    );
  }
}
