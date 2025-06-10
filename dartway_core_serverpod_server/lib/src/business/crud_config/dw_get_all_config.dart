import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:serverpod/serverpod.dart';

class DwGetAllConfig<T extends TableRow> {
  const DwGetAllConfig({
    this.additionalEntitiesFetchFunction,
    this.defaultOrderByList,
  });

  final List<Order>? defaultOrderByList;
  final Future<List<TableRow>> Function(Session session, List<T> models)?
      additionalEntitiesFetchFunction;

  // Future<DwApiResponse<List<int>>> getIds(
  //   Session session, {
  //   Expression? whereClause,
  //   int? limit,
  //   int? offset,
  // }) async {
  //   final resultItems = await session.db.find<T>(
  //     where: whereClause,
  //     orderByList: defaultOrderByList,
  //     limit: limit,
  //     offset: offset,
  //   );

  //   return DwApiResponse<List<int>>(
  //     isOk: true,
  //     value: [
  //       ...resultItems.map((e) => e.id!),
  //     ],
  //     updatedEntities: [
  //       ...resultItems,
  //       if (additionalEntitiesFetchFunction != null)
  //         ...(await additionalEntitiesFetchFunction!(
  //           session,
  //           resultItems,
  //         ))
  //     ]
  //         .map(
  //           (e) => DwObjectWrapper(object: e),
  //         )
  //         .toList(),
  //   );
  // }

  Future<DwApiResponse<List<DwModelWrapper>>> getEntityList(
    Session session, {
    Expression? whereClause,
    int? limit,
    int? offset,
  }) async {
    final resultItems = await session.db.find<T>(
      where: whereClause,
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
