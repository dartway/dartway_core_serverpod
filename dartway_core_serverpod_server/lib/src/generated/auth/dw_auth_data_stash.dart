/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class DwAuthDataStash
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  DwAuthDataStash._({
    this.id,
    required this.type,
    required this.identifier,
    required this.createdAt,
    required this.data,
  });

  factory DwAuthDataStash({
    int? id,
    required String type,
    required String identifier,
    required DateTime createdAt,
    required Map<String, String> data,
  }) = _DwAuthDataStashImpl;

  factory DwAuthDataStash.fromJson(Map<String, dynamic> jsonSerialization) {
    return DwAuthDataStash(
      id: jsonSerialization['id'] as int?,
      type: jsonSerialization['type'] as String,
      identifier: jsonSerialization['identifier'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      data: (jsonSerialization['data'] as Map).map((k, v) => MapEntry(
            k as String,
            v as String,
          )),
    );
  }

  static final t = DwAuthDataStashTable();

  static const db = DwAuthDataStashRepository._();

  @override
  int? id;

  String type;

  String identifier;

  DateTime createdAt;

  Map<String, String> data;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [DwAuthDataStash]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DwAuthDataStash copyWith({
    int? id,
    String? type,
    String? identifier,
    DateTime? createdAt,
    Map<String, String>? data,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'type': type,
      'identifier': identifier,
      'createdAt': createdAt.toJson(),
      'data': data.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'type': type,
      'identifier': identifier,
      'createdAt': createdAt.toJson(),
      'data': data.toJson(),
    };
  }

  static DwAuthDataStashInclude include() {
    return DwAuthDataStashInclude._();
  }

  static DwAuthDataStashIncludeList includeList({
    _i1.WhereExpressionBuilder<DwAuthDataStashTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DwAuthDataStashTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DwAuthDataStashTable>? orderByList,
    DwAuthDataStashInclude? include,
  }) {
    return DwAuthDataStashIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DwAuthDataStash.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DwAuthDataStash.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DwAuthDataStashImpl extends DwAuthDataStash {
  _DwAuthDataStashImpl({
    int? id,
    required String type,
    required String identifier,
    required DateTime createdAt,
    required Map<String, String> data,
  }) : super._(
          id: id,
          type: type,
          identifier: identifier,
          createdAt: createdAt,
          data: data,
        );

  /// Returns a shallow copy of this [DwAuthDataStash]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DwAuthDataStash copyWith({
    Object? id = _Undefined,
    String? type,
    String? identifier,
    DateTime? createdAt,
    Map<String, String>? data,
  }) {
    return DwAuthDataStash(
      id: id is int? ? id : this.id,
      type: type ?? this.type,
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

class DwAuthDataStashTable extends _i1.Table<int?> {
  DwAuthDataStashTable({super.tableRelation})
      : super(tableName: 'dw_auth_data_stash') {
    type = _i1.ColumnString(
      'type',
      this,
    );
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

  late final _i1.ColumnString type;

  late final _i1.ColumnString identifier;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnSerializable data;

  @override
  List<_i1.Column> get columns => [
        id,
        type,
        identifier,
        createdAt,
        data,
      ];
}

class DwAuthDataStashInclude extends _i1.IncludeObject {
  DwAuthDataStashInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => DwAuthDataStash.t;
}

class DwAuthDataStashIncludeList extends _i1.IncludeList {
  DwAuthDataStashIncludeList._({
    _i1.WhereExpressionBuilder<DwAuthDataStashTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DwAuthDataStash.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => DwAuthDataStash.t;
}

class DwAuthDataStashRepository {
  const DwAuthDataStashRepository._();

  /// Returns a list of [DwAuthDataStash]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<DwAuthDataStash>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DwAuthDataStashTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DwAuthDataStashTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DwAuthDataStashTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<DwAuthDataStash>(
      where: where?.call(DwAuthDataStash.t),
      orderBy: orderBy?.call(DwAuthDataStash.t),
      orderByList: orderByList?.call(DwAuthDataStash.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [DwAuthDataStash] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<DwAuthDataStash?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DwAuthDataStashTable>? where,
    int? offset,
    _i1.OrderByBuilder<DwAuthDataStashTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DwAuthDataStashTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<DwAuthDataStash>(
      where: where?.call(DwAuthDataStash.t),
      orderBy: orderBy?.call(DwAuthDataStash.t),
      orderByList: orderByList?.call(DwAuthDataStash.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [DwAuthDataStash] by its [id] or null if no such row exists.
  Future<DwAuthDataStash?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<DwAuthDataStash>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [DwAuthDataStash]s in the list and returns the inserted rows.
  ///
  /// The returned [DwAuthDataStash]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<DwAuthDataStash>> insert(
    _i1.Session session,
    List<DwAuthDataStash> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DwAuthDataStash>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [DwAuthDataStash] and returns the inserted row.
  ///
  /// The returned [DwAuthDataStash] will have its `id` field set.
  Future<DwAuthDataStash> insertRow(
    _i1.Session session,
    DwAuthDataStash row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DwAuthDataStash>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [DwAuthDataStash]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<DwAuthDataStash>> update(
    _i1.Session session,
    List<DwAuthDataStash> rows, {
    _i1.ColumnSelections<DwAuthDataStashTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DwAuthDataStash>(
      rows,
      columns: columns?.call(DwAuthDataStash.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DwAuthDataStash]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<DwAuthDataStash> updateRow(
    _i1.Session session,
    DwAuthDataStash row, {
    _i1.ColumnSelections<DwAuthDataStashTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DwAuthDataStash>(
      row,
      columns: columns?.call(DwAuthDataStash.t),
      transaction: transaction,
    );
  }

  /// Deletes all [DwAuthDataStash]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<DwAuthDataStash>> delete(
    _i1.Session session,
    List<DwAuthDataStash> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DwAuthDataStash>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [DwAuthDataStash].
  Future<DwAuthDataStash> deleteRow(
    _i1.Session session,
    DwAuthDataStash row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DwAuthDataStash>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<DwAuthDataStash>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DwAuthDataStashTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DwAuthDataStash>(
      where: where(DwAuthDataStash.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DwAuthDataStashTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DwAuthDataStash>(
      where: where?.call(DwAuthDataStash.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
