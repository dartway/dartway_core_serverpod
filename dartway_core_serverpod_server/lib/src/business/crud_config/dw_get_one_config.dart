import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:serverpod/serverpod.dart';

class DwGetOneConfig<T extends TableRow> {
  const DwGetOneConfig({
    required this.filterPrototype,
    this.include,
    this.createIfMissing,
    this.additionalEntitiesFetchFunction,
  });

  final DwBackendFilter filterPrototype;
  final Include? include;
  final Future<T?> Function(
    Session session,
    DwBackendFilter filter,
  )? createIfMissing;

  final Future<List<TableRow>> Function(Session session, T model)?
      additionalEntitiesFetchFunction;

  Future<T?> _getObject(
    Session session,
    Table table,
    DwBackendFilter filter,
  ) async {
    return await session.db.findFirstRow(
          where: filter.prepareWhere(table),
          include: include,
        ) ??
        await createIfMissing?.call(
          session,
          filter,
        );
  }

  Future<DwApiResponse<DwModelWrapper>> call(
    Session session,
    Table table,
    DwBackendFilter filter,
  ) async {
    final t = await _getObject(session, table, filter).then(
      (result) async => DwApiResponse<DwModelWrapper>(
        isOk: true,
        value: DwModelWrapper.wrap(result),
        // error: result == null ? 'Объект не найден' : null,
        updatedEntities: result != null
            ? [
                DwModelWrapper(object: result),
                if (additionalEntitiesFetchFunction != null)
                  ...(await (additionalEntitiesFetchFunction!(session, result)))
                      .map(
                    (e) => DwModelWrapper(object: e),
                  )
              ]
            : null,
      ),
    );

    return t;
  }
}
