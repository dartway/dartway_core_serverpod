/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: invalid_use_of_visible_for_testing_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class DwDataStash implements _i1.TableRow, _i1.ProtocolSerialization {
  DwDataStash._({
    this.id,
    required this.identifier,
    required this.createdAt,
    required this.data,
  });

  factory DwDataStash({
    int? id,
    required String identifier,
    required DateTime createdAt,
    required Map<String, String> data,
  }) = _DwDataStashImpl;

  factory DwDataStash.fromJson(Map<String, dynamic> jsonSerialization) {
    return DwDataStash(
      id: jsonSerialization['id'] as int?,
      identifier: jsonSerialization['identifier'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      data: (jsonSerialization['data'] as Map).map((k, v) => MapEntry(
            k as String,
            v as String,
          )),
    );
  }

  static final t = DwDataStashTable();

  static const db = DwDataStashRepository._();

  @override
  int? id;

  String identifier;

  DateTime createdAt;

  Map<String, String> data;

  @override
  _i1.Table get table => t;

  DwDataStash copyWith({
    int? id,
    String? identifier,
    DateTime? createdAt,
    Map<String, String>? data,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'identifier': identifier,
      'createdAt': createdAt.toJson(),
      'data': data.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'identifier': identifier,
      'createdAt': createdAt.toJson(),
      'data': data.toJson(),
    };
  }

  static DwDataStashInclude include() {
    return DwDataStashInclude._();
  }

  static DwDataStashIncludeList includeList({
    _i1.WhereExpressionBuilder<DwDataStashTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DwDataStashTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DwDataStashTable>? orderByList,
    DwDataStashInclude? include,
  }) {
    return DwDataStashIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DwDataStash.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DwDataStash.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DwDataStashImpl extends DwDataStash {
  _DwDataStashImpl({
    int? id,
    required String identifier,
    required DateTime createdAt,
    required Map<String, String> data,
  }) : super._(
          id: id,
          identifier: identifier,
          createdAt: createdAt,
          data: data,
        );

  @override
  DwDataStash copyWith({
    Object? id = _Undefined,
    String? identifier,
    DateTime? createdAt,
    Map<String, String>? data,
  }) {
    return DwDataStash(
      id: id is int? ? id : this.id,
      identifier: identifier ?? this.identifier,
      createdAt: createdAt ?? this.createdAt,
      data: data ??
          this.data.map((
                key0,
                value0,
              ) =>
                  MapEntry(
                    key0,
                    value0,
                  )),
    );
  }
}

class DwDataStashTable extends _i1.Table {
  DwDataStashTable({super.tableRelation}) : super(tableName: 'dw_data_stash') {
    identifier = _i1.ColumnString(
      'identifier',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    data = _i1.ColumnSerializable(
      'data',
      this,
    );
  }

  late final _i1.ColumnString identifier;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnSerializable data;

  @override
  List<_i1.Column> get columns => [
        id,
        identifier,
        createdAt,
        data,
      ];
}

class DwDataStashInclude extends _i1.IncludeObject {
  DwDataStashInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => DwDataStash.t;
}

class DwDataStashIncludeList extends _i1.IncludeList {
  DwDataStashIncludeList._({
    _i1.WhereExpressionBuilder<DwDataStashTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DwDataStash.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => DwDataStash.t;
}

class DwDataStashRepository {
  const DwDataStashRepository._();

  Future<List<DwDataStash>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DwDataStashTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DwDataStashTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DwDataStashTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<DwDataStash>(
      where: where?.call(DwDataStash.t),
      orderBy: orderBy?.call(DwDataStash.t),
      orderByList: orderByList?.call(DwDataStash.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<DwDataStash?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DwDataStashTable>? where,
    int? offset,
    _i1.OrderByBuilder<DwDataStashTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DwDataStashTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<DwDataStash>(
      where: where?.call(DwDataStash.t),
      orderBy: orderBy?.call(DwDataStash.t),
      orderByList: orderByList?.call(DwDataStash.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<DwDataStash?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<DwDataStash>(
      id,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<DwDataStash>> insert(
    _i1.Session session,
    List<DwDataStash> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DwDataStash>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<DwDataStash> insertRow(
    _i1.Session session,
    DwDataStash row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DwDataStash>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<DwDataStash>> update(
    _i1.Session session,
    List<DwDataStash> rows, {
    _i1.ColumnSelections<DwDataStashTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DwDataStash>(
      rows,
      columns: columns?.call(DwDataStash.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<DwDataStash> updateRow(
    _i1.Session session,
    DwDataStash row, {
    _i1.ColumnSelections<DwDataStashTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DwDataStash>(
      row,
      columns: columns?.call(DwDataStash.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<DwDataStash>> delete(
    _i1.Session session,
    List<DwDataStash> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DwDataStash>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<DwDataStash> deleteRow(
    _i1.Session session,
    DwDataStash row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DwDataStash>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<DwDataStash>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DwDataStashTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DwDataStash>(
      where: where(DwDataStash.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DwDataStashTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DwDataStash>(
      where: where?.call(DwDataStash.t),
      limit: limit,
      transaction: transaction ?? session.transaction,
    );
  }
}
