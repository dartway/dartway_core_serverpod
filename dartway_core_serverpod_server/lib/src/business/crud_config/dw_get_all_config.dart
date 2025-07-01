import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:serverpod/serverpod.dart';

class DwGetAllConfig<T extends TableRow> {
  const DwGetAllConfig({
    this.include,
    this.additionalEntitiesFetchFunction,
    this.defaultOrderByList,
  });

  final Include? include;
  final List<Order>? defaultOrderByList;
  final Future<List<TableRow>> Function(Session session, List<T> models)?
      additionalEntitiesFetchFunction;

  Future<DwApiResponse<int>> getCount(
    Session session, {
    Expression? whereClause,
  }) async {
    final result = await session.db.count<T>(
      where: whereClause,
    );

    return DwApiResponse<int>(
      isOk: true,
      value: result,
    );
  }

  Future<DwApiResponse<List<DwModelWrapper>>> getEntityList(
    Session session, {
    Expression? whereClause,
    int? limit,
    int? offset,
  }) async {
    final resultItems = await session.db.find<T>(
      where: whereClause,
      include: include,
      orderByList: defaultOrderByList,
      limit: limit,
      offset: offset,
    );

    return DwApiResponse<List<DwModelWrapper>>(
      isOk: true,
      value: resultItems
          .map(
            (e) => DwModelWrapper(object: e),
          )
          .toList(),
      updatedEntities: [
        if (additionalEntitiesFetchFunction != null)
          ...(await additionalEntitiesFetchFunction!(
            session,
            resultItems,
          ))
      ]
          .map(
            (e) => DwModelWrapper(object: e),
          )
          .toList(),
    );
  }
}
