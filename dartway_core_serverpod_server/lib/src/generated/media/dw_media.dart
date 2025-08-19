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
import '../media/dw_media_type.dart' as _i2;

abstract class DwMedia
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  DwMedia._({
    this.id,
    required this.type,
    required this.createdAt,
    required this.publicUrl,
    this.duration,
  });

  factory DwMedia({
    int? id,
    required _i2.DwMediaType type,
    required DateTime createdAt,
    required String publicUrl,
    int? duration,
  }) = _DwMediaImpl;

  factory DwMedia.fromJson(Map<String, dynamic> jsonSerialization) {
    return DwMedia(
      id: jsonSerialization['id'] as int?,
      type: _i2.DwMediaType.fromJson((jsonSerialization['type'] as int)),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      publicUrl: jsonSerialization['publicUrl'] as String,
      duration: jsonSerialization['duration'] as int?,
    );
  }

  static final t = DwMediaTable();

  static const db = DwMediaRepository._();

  @override
  int? id;

  _i2.DwMediaType type;

  DateTime createdAt;

  String publicUrl;

  int? duration;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [DwMedia]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DwMedia copyWith({
    int? id,
    _i2.DwMediaType? type,
    DateTime? createdAt,
    String? publicUrl,
    int? duration,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'type': type.toJson(),
      'createdAt': createdAt.toJson(),
      'publicUrl': publicUrl,
      if (duration != null) 'duration': duration,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'type': type.toJson(),
      'createdAt': createdAt.toJson(),
      'publicUrl': publicUrl,
      if (duration != null) 'duration': duration,
    };
  }

  static DwMediaInclude include() {
    return DwMediaInclude._();
  }

  static DwMediaIncludeList includeList({
    _i1.WhereExpressionBuilder<DwMediaTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DwMediaTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DwMediaTable>? orderByList,
    DwMediaInclude? include,
  }) {
    return DwMediaIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DwMedia.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DwMedia.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DwMediaImpl extends DwMedia {
  _DwMediaImpl({
    int? id,
    required _i2.DwMediaType type,
    required DateTime createdAt,
    required String publicUrl,
    int? duration,
  }) : super._(
          id: id,
          type: type,
          createdAt: createdAt,
          publicUrl: publicUrl,
          duration: duration,
        );

  /// Returns a shallow copy of this [DwMedia]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DwMedia copyWith({
    Object? id = _Undefined,
    _i2.DwMediaType? type,
    DateTime? createdAt,
    String? publicUrl,
    Object? duration = _Undefined,
  }) {
    return DwMedia(
      id: id is int? ? id : this.id,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      publicUrl: publicUrl ?? this.publicUrl,
      duration: duration is int? ? duration : this.duration,
    );
  }
}

class DwMediaTable extends _i1.Table<int?> {
  DwMediaTable({super.tableRelation}) : super(tableName: 'dw_media') {
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byIndex,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    publicUrl = _i1.ColumnString(
      'publicUrl',
      this,
    );
    duration = _i1.ColumnInt(
      'duration',
      this,
    );
  }

  late final _i1.ColumnEnum<_i2.DwMediaType> type;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnString publicUrl;

  late final _i1.ColumnInt duration;

  @override
  List<_i1.Column> get columns => [
        id,
        type,
        createdAt,
        publicUrl,
        duration,
      ];
}

class DwMediaInclude extends _i1.IncludeObject {
  DwMediaInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => DwMedia.t;
}

class DwMediaIncludeList extends _i1.IncludeList {
  DwMediaIncludeList._({
    _i1.WhereExpressionBuilder<DwMediaTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DwMedia.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => DwMedia.t;
}

class DwMediaRepository {
  const DwMediaRepository._();

  /// Returns a list of [DwMedia]s matching the given query parameters.
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
  Future<List<DwMedia>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DwMediaTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DwMediaTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DwMediaTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<DwMedia>(
      where: where?.call(DwMedia.t),
      orderBy: orderBy?.call(DwMedia.t),
      orderByList: orderByList?.call(DwMedia.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [DwMedia] matching the given query parameters.
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
  Future<DwMedia?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DwMediaTable>? where,
    int? offset,
    _i1.OrderByBuilder<DwMediaTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DwMediaTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<DwMedia>(
      where: where?.call(DwMedia.t),
      orderBy: orderBy?.call(DwMedia.t),
      orderByList: orderByList?.call(DwMedia.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [DwMedia] by its [id] or null if no such row exists.
  Future<DwMedia?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<DwMedia>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [DwMedia]s in the list and returns the inserted rows.
  ///
  /// The returned [DwMedia]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<DwMedia>> insert(
    _i1.Session session,
    List<DwMedia> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DwMedia>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [DwMedia] and returns the inserted row.
  ///
  /// The returned [DwMedia] will have its `id` field set.
  Future<DwMedia> insertRow(
    _i1.Session session,
    DwMedia row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DwMedia>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [DwMedia]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<DwMedia>> update(
    _i1.Session session,
    List<DwMedia> rows, {
    _i1.ColumnSelections<DwMediaTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DwMedia>(
      rows,
      columns: columns?.call(DwMedia.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DwMedia]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<DwMedia> updateRow(
    _i1.Session session,
    DwMedia row, {
    _i1.ColumnSelections<DwMediaTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DwMedia>(
      row,
      columns: columns?.call(DwMedia.t),
      transaction: transaction,
    );
  }

  /// Deletes all [DwMedia]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<DwMedia>> delete(
    _i1.Session session,
    List<DwMedia> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DwMedia>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [DwMedia].
  Future<DwMedia> deleteRow(
    _i1.Session session,
    DwMedia row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DwMedia>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<DwMedia>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DwMediaTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DwMedia>(
      where: where(DwMedia.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DwMediaTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DwMedia>(
      where: where?.call(DwMedia.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
