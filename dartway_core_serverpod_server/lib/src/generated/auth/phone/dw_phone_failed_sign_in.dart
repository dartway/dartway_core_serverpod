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

/// Database table for tracking failed email sign-ins. Saves IP-address, time,
/// and email to be prevent brute force attacks.
abstract class DwPhoneFailedSignIn
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  DwPhoneFailedSignIn._({
    this.id,
    required this.phoneNumber,
    required this.time,
    required this.ipAddress,
  });

  factory DwPhoneFailedSignIn({
    int? id,
    required String phoneNumber,
    required DateTime time,
    required String ipAddress,
  }) = _DwPhoneFailedSignInImpl;

  factory DwPhoneFailedSignIn.fromJson(Map<String, dynamic> jsonSerialization) {
    return DwPhoneFailedSignIn(
      id: jsonSerialization['id'] as int?,
      phoneNumber: jsonSerialization['phoneNumber'] as String,
      time: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['time']),
      ipAddress: jsonSerialization['ipAddress'] as String,
    );
  }

  static final t = DwPhoneFailedSignInTable();

  static const db = DwPhoneFailedSignInRepository._();

  @override
  int? id;

  /// Email attempting to sign in with.
  String phoneNumber;

  /// The time of the sign in attempt.
  DateTime time;

  /// The IP address of the sign in attempt.
  String ipAddress;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [DwPhoneFailedSignIn]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DwPhoneFailedSignIn copyWith({
    int? id,
    String? phoneNumber,
    DateTime? time,
    String? ipAddress,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'phoneNumber': phoneNumber,
      'time': time.toJson(),
      'ipAddress': ipAddress,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'phoneNumber': phoneNumber,
      'time': time.toJson(),
      'ipAddress': ipAddress,
    };
  }

  static DwPhoneFailedSignInInclude include() {
    return DwPhoneFailedSignInInclude._();
  }

  static DwPhoneFailedSignInIncludeList includeList({
    _i1.WhereExpressionBuilder<DwPhoneFailedSignInTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DwPhoneFailedSignInTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DwPhoneFailedSignInTable>? orderByList,
    DwPhoneFailedSignInInclude? include,
  }) {
    return DwPhoneFailedSignInIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DwPhoneFailedSignIn.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DwPhoneFailedSignIn.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DwPhoneFailedSignInImpl extends DwPhoneFailedSignIn {
  _DwPhoneFailedSignInImpl({
    int? id,
    required String phoneNumber,
    required DateTime time,
    required String ipAddress,
  }) : super._(
          id: id,
          phoneNumber: phoneNumber,
          time: time,
          ipAddress: ipAddress,
        );

  /// Returns a shallow copy of this [DwPhoneFailedSignIn]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DwPhoneFailedSignIn copyWith({
    Object? id = _Undefined,
    String? phoneNumber,
    DateTime? time,
    String? ipAddress,
  }) {
    return DwPhoneFailedSignIn(
      id: id is int? ? id : this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      time: time ?? this.time,
      ipAddress: ipAddress ?? this.ipAddress,
    );
  }
}

class DwPhoneFailedSignInTable extends _i1.Table<int?> {
  DwPhoneFailedSignInTable({super.tableRelation})
      : super(tableName: 'dw_phone_failed_sign_in') {
    phoneNumber = _i1.ColumnString(
      'phoneNumber',
      this,
    );
    time = _i1.ColumnDateTime(
      'time',
      this,
    );
    ipAddress = _i1.ColumnString(
      'ipAddress',
      this,
    );
  }

  /// Email attempting to sign in with.
  late final _i1.ColumnString phoneNumber;

  /// The time of the sign in attempt.
  late final _i1.ColumnDateTime time;

  /// The IP address of the sign in attempt.
  late final _i1.ColumnString ipAddress;

  @override
  List<_i1.Column> get columns => [
        id,
        phoneNumber,
        time,
        ipAddress,
      ];
}

class DwPhoneFailedSignInInclude extends _i1.IncludeObject {
  DwPhoneFailedSignInInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => DwPhoneFailedSignIn.t;
}

class DwPhoneFailedSignInIncludeList extends _i1.IncludeList {
  DwPhoneFailedSignInIncludeList._({
    _i1.WhereExpressionBuilder<DwPhoneFailedSignInTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DwPhoneFailedSignIn.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => DwPhoneFailedSignIn.t;
}

class DwPhoneFailedSignInRepository {
  const DwPhoneFailedSignInRepository._();

  /// Returns a list of [DwPhoneFailedSignIn]s matching the given query parameters.
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
  Future<List<DwPhoneFailedSignIn>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DwPhoneFailedSignInTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DwPhoneFailedSignInTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DwPhoneFailedSignInTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<DwPhoneFailedSignIn>(
      where: where?.call(DwPhoneFailedSignIn.t),
      orderBy: orderBy?.call(DwPhoneFailedSignIn.t),
      orderByList: orderByList?.call(DwPhoneFailedSignIn.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [DwPhoneFailedSignIn] matching the given query parameters.
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
  Future<DwPhoneFailedSignIn?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DwPhoneFailedSignInTable>? where,
    int? offset,
    _i1.OrderByBuilder<DwPhoneFailedSignInTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DwPhoneFailedSignInTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<DwPhoneFailedSignIn>(
      where: where?.call(DwPhoneFailedSignIn.t),
      orderBy: orderBy?.call(DwPhoneFailedSignIn.t),
      orderByList: orderByList?.call(DwPhoneFailedSignIn.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [DwPhoneFailedSignIn] by its [id] or null if no such row exists.
  Future<DwPhoneFailedSignIn?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<DwPhoneFailedSignIn>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [DwPhoneFailedSignIn]s in the list and returns the inserted rows.
  ///
  /// The returned [DwPhoneFailedSignIn]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<DwPhoneFailedSignIn>> insert(
    _i1.Session session,
    List<DwPhoneFailedSignIn> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DwPhoneFailedSignIn>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [DwPhoneFailedSignIn] and returns the inserted row.
  ///
  /// The returned [DwPhoneFailedSignIn] will have its `id` field set.
  Future<DwPhoneFailedSignIn> insertRow(
    _i1.Session session,
    DwPhoneFailedSignIn row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DwPhoneFailedSignIn>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [DwPhoneFailedSignIn]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<DwPhoneFailedSignIn>> update(
    _i1.Session session,
    List<DwPhoneFailedSignIn> rows, {
    _i1.ColumnSelections<DwPhoneFailedSignInTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DwPhoneFailedSignIn>(
      rows,
      columns: columns?.call(DwPhoneFailedSignIn.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DwPhoneFailedSignIn]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<DwPhoneFailedSignIn> updateRow(
    _i1.Session session,
    DwPhoneFailedSignIn row, {
    _i1.ColumnSelections<DwPhoneFailedSignInTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DwPhoneFailedSignIn>(
      row,
      columns: columns?.call(DwPhoneFailedSignIn.t),
      transaction: transaction,
    );
  }

  /// Deletes all [DwPhoneFailedSignIn]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<DwPhoneFailedSignIn>> delete(
    _i1.Session session,
    List<DwPhoneFailedSignIn> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DwPhoneFailedSignIn>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [DwPhoneFailedSignIn].
  Future<DwPhoneFailedSignIn> deleteRow(
    _i1.Session session,
    DwPhoneFailedSignIn row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DwPhoneFailedSignIn>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<DwPhoneFailedSignIn>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DwPhoneFailedSignInTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DwPhoneFailedSignIn>(
      where: where(DwPhoneFailedSignIn.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DwPhoneFailedSignInTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DwPhoneFailedSignIn>(
      where: where?.call(DwPhoneFailedSignIn.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
