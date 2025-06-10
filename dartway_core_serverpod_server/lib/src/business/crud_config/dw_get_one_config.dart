import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:serverpod/serverpod.dart';

class DwGetOneConfig<T extends TableRow> {
  const DwGetOneConfig({
    required this.filterPrototype,
    this.createIfMissing,
    this.additionalEntitiesFetchFunction,
  });

  final DwBackendFilter filterPrototype;
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
    // T? t = await session.db.findFirstRow(where: whereClause);

    // if (t == null && createIfMissing != null) {
    //   t ??= await createIfMissing?.call(
    //     session,
    //     attributeNames
    //         .map((e) => filters.firstWhere((f) => f.fieldName == e).equalsTo)
    //         .toList(),
    //   );

    //   if (t != null) {
    //     t = await session.db.insertRow<T>(t);
    //   }
    // }

    return await session.db.findFirstRow(where: filter.prepareWhere(table)) ??
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
