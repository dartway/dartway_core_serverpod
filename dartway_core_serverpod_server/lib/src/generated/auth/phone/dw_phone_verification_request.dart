/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../auth/phone/dw_phone_verification_request_type.dart' as _i2;
import '../../auth/dw_auth_data_stash.dart' as _i3;

/// Database bindings for a sign in with phone.
abstract class DwPhoneVerificationRequest
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  DwPhoneVerificationRequest._({
    this.id,
    required this.requestType,
    required this.phoneNumber,
    required this.hash,
    DateTime? createdAt,
    required this.expirationTime,
    this.stashDataId,
    this.stashData,
    bool? isUsed,
  })  : createdAt = createdAt ?? DateTime.now(),
        isUsed = isUsed ?? false;

  factory DwPhoneVerificationRequest({
    int? id,
    required _i2.DwPhoneVerificationRequestType requestType,
    required String phoneNumber,
    required String hash,
    DateTime? createdAt,
    required DateTime expirationTime,
    int? stashDataId,
    _i3.DwAuthDataStash? stashData,
    bool? isUsed,
  }) = _DwPhoneVerificationRequestImpl;

  factory DwPhoneVerificationRequest.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return DwPhoneVerificationRequest(
      id: jsonSerialization['id'] as int?,
      requestType: _i2.DwPhoneVerificationRequestType.fromJson(
          (jsonSerialization['requestType'] as String)),
      phoneNumber: jsonSerialization['phoneNumber'] as String,
      hash: jsonSerialization['hash'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      expirationTime: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['expirationTime']),
      stashDataId: jsonSerialization['stashDataId'] as int?,
      stashData: jsonSerialization['stashData'] == null
          ? null
          : _i3.DwAuthDataStash.fromJson(
              (jsonSerialization['stashData'] as Map<String, dynamic>)),
      isUsed: jsonSerialization['isUsed'] as bool,
    );
  }

  static final t = DwPhoneVerificationRequestTable();

  static const db = DwPhoneVerificationRequestRepository._();

  @override
  int? id;

  /// The type of request, e.g. registration, signIn, passwordReset, changePhoneNumber, other
  /// See [DwPhoneVerificationRequestType](dw_phone_verification_request_type.spy.yaml)
  _i2.DwPhoneVerificationRequestType requestType;

  /// The phoneNumber for verification
  String phoneNumber;

  /// The hashed otp
  String hash;

  /// The expiration time of the otp
  DateTime createdAt;

  DateTime expirationTime;

  int? stashDataId;

  _i3.DwAuthDataStash? stashData;

  /// If the otp has been used
  bool isUsed;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [DwPhoneVerificationRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DwPhoneVerificationRequest copyWith({
    int? id,
    _i2.DwPhoneVerificationRequestType? requestType,
    String? phoneNumber,
    String? hash,
    DateTime? createdAt,
    DateTime? expirationTime,
    int? stashDataId,
    _i3.DwAuthDataStash? stashData,
    bool? isUsed,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'requestType': requestType.toJson(),
      'phoneNumber': phoneNumber,
      'hash': hash,
      'createdAt': createdAt.toJson(),
      'expirationTime': expirationTime.toJson(),
      if (stashDataId != null) 'stashDataId': stashDataId,
      if (stashData != null) 'stashData': stashData?.toJson(),
      'isUsed': isUsed,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'requestType': requestType.toJson(),
      'phoneNumber': phoneNumber,
      'hash': hash,
      'createdAt': createdAt.toJson(),
      'expirationTime': expirationTime.toJson(),
      if (stashDataId != null) 'stashDataId': stashDataId,
      if (stashData != null) 'stashData': stashData?.toJsonForProtocol(),
      'isUsed': isUsed,
    };
  }

  static DwPhoneVerificationRequestInclude include(
      {_i3.DwAuthDataStashInclude? stashData}) {
    return DwPhoneVerificationRequestInclude._(stashData: stashData);
  }

  static DwPhoneVerificationRequestIncludeList includeList({
    _i1.WhereExpressionBuilder<DwPhoneVerificationRequestTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DwPhoneVerificationRequestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DwPhoneVerificationRequestTable>? orderByList,
    DwPhoneVerificationRequestInclude? include,
  }) {
    return DwPhoneVerificationRequestIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DwPhoneVerificationRequest.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DwPhoneVerificationRequest.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DwPhoneVerificationRequestImpl extends DwPhoneVerificationRequest {
  _DwPhoneVerificationRequestImpl({
    int? id,
    required _i2.DwPhoneVerificationRequestType requestType,
    required String phoneNumber,
    required String hash,
    DateTime? createdAt,
    required DateTime expirationTime,
    int? stashDataId,
    _i3.DwAuthDataStash? stashData,
    bool? isUsed,
  }) : super._(
          id: id,
          requestType: requestType,
          phoneNumber: phoneNumber,
          hash: hash,
          createdAt: createdAt,
          expirationTime: expirationTime,
          stashDataId: stashDataId,
          stashData: stashData,
          isUsed: isUsed,
        );

  /// Returns a shallow copy of this [DwPhoneVerificationRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DwPhoneVerificationRequest copyWith({
    Object? id = _Undefined,
    _i2.DwPhoneVerificationRequestType? requestType,
    String? phoneNumber,
    String? hash,
    DateTime? createdAt,
    DateTime? expirationTime,
    Object? stashDataId = _Undefined,
    Object? stashData = _Undefined,
    bool? isUsed,
  }) {
    return DwPhoneVerificationRequest(
      id: id is int? ? id : this.id,
      requestType: requestType ?? this.requestType,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      hash: hash ?? this.hash,
      createdAt: createdAt ?? this.createdAt,
      expirationTime: expirationTime ?? this.expirationTime,
      stashDataId: stashDataId is int? ? stashDataId : this.stashDataId,
      stashData: stashData is _i3.DwAuthDataStash?
          ? stashData
          : this.stashData?.copyWith(),
      isUsed: isUsed ?? this.isUsed,
    );
  }
}

class DwPhoneVerificationRequestTable extends _i1.Table<int?> {
  DwPhoneVerificationRequestTable({super.tableRelation})
      : super(tableName: 'dw_phone_verification_request') {
    requestType = _i1.ColumnEnum(
      'requestType',
      this,
      _i1.EnumSerialization.byName,
    );
    phoneNumber = _i1.ColumnString(
      'phoneNumber',
      this,
    );
    hash = _i1.ColumnString(
      'hash',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    expirationTime = _i1.ColumnDateTime(
      'expirationTime',
      this,
    );
    stashDataId = _i1.ColumnInt(
      'stashDataId',
      this,
    );
    isUsed = _i1.ColumnBool(
      'isUsed',
      this,
      hasDefault: true,
    );
  }

  /// The type of request, e.g. registration, signIn, passwordReset, changePhoneNumber, other
  /// See [DwPhoneVerificationRequestType](dw_phone_verification_request_type.spy.yaml)
  late final _i1.ColumnEnum<_i2.DwPhoneVerificationRequestType> requestType;

  /// The phoneNumber for verification
  late final _i1.ColumnString phoneNumber;

  /// The hashed otp
  late final _i1.ColumnString hash;

  /// The expiration time of the otp
  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime expirationTime;

  late final _i1.ColumnInt stashDataId;

  _i3.DwAuthDataStashTable? _stashData;

  /// If the otp has been used
  late final _i1.ColumnBool isUsed;

  _i3.DwAuthDataStashTable get stashData {
    if (_stashData != null) return _stashData!;
    _stashData = _i1.createRelationTable(
      relationFieldName: 'stashData',
      field: DwPhoneVerificationRequest.t.stashDataId,
      foreignField: _i3.DwAuthDataStash.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.DwAuthDataStashTable(tableRelation: foreignTableRelation),
    );
    return _stashData!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        requestType,
        phoneNumber,
        hash,
        createdAt,
        expirationTime,
        stashDataId,
        isUsed,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'stashData') {
      return stashData;
    }
    return null;
  }
}

class DwPhoneVerificationRequestInclude extends _i1.IncludeObject {
  DwPhoneVerificationRequestInclude._({_i3.DwAuthDataStashInclude? stashData}) {
    _stashData = stashData;
  }

  _i3.DwAuthDataStashInclude? _stashData;

  @override
  Map<String, _i1.Include?> get includes => {'stashData': _stashData};

  @override
  _i1.Table<int?> get table => DwPhoneVerificationRequest.t;
}

class DwPhoneVerificationRequestIncludeList extends _i1.IncludeList {
  DwPhoneVerificationRequestIncludeList._({
    _i1.WhereExpressionBuilder<DwPhoneVerificationRequestTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DwPhoneVerificationRequest.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => DwPhoneVerificationRequest.t;
}

class DwPhoneVerificationRequestRepository {
  const DwPhoneVerificationRequestRepository._();

  final attachRow = const DwPhoneVerificationRequestAttachRowRepository._();

  final detachRow = const DwPhoneVerificationRequestDetachRowRepository._();

  /// Returns a list of [DwPhoneVerificationRequest]s matching the given query parameters.
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
  Future<List<DwPhoneVerificationRequest>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DwPhoneVerificationRequestTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DwPhoneVerificationRequestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DwPhoneVerificationRequestTable>? orderByList,
    _i1.Transaction? transaction,
    DwPhoneVerificationRequestInclude? include,
  }) async {
    return session.db.find<DwPhoneVerificationRequest>(
      where: where?.call(DwPhoneVerificationRequest.t),
      orderBy: orderBy?.call(DwPhoneVerificationRequest.t),
      orderByList: orderByList?.call(DwPhoneVerificationRequest.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [DwPhoneVerificationRequest] matching the given query parameters.
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
  Future<DwPhoneVerificationRequest?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DwPhoneVerificationRequestTable>? where,
    int? offset,
    _i1.OrderByBuilder<DwPhoneVerificationRequestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DwPhoneVerificationRequestTable>? orderByList,
    _i1.Transaction? transaction,
    DwPhoneVerificationRequestInclude? include,
  }) async {
    return session.db.findFirstRow<DwPhoneVerificationRequest>(
      where: where?.call(DwPhoneVerificationRequest.t),
      orderBy: orderBy?.call(DwPhoneVerificationRequest.t),
      orderByList: orderByList?.call(DwPhoneVerificationRequest.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [DwPhoneVerificationRequest] by its [id] or null if no such row exists.
  Future<DwPhoneVerificationRequest?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    DwPhoneVerificationRequestInclude? include,
  }) async {
    return session.db.findById<DwPhoneVerificationRequest>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [DwPhoneVerificationRequest]s in the list and returns the inserted rows.
  ///
  /// The returned [DwPhoneVerificationRequest]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<DwPhoneVerificationRequest>> insert(
    _i1.Session session,
    List<DwPhoneVerificationRequest> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DwPhoneVerificationRequest>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [DwPhoneVerificationRequest] and returns the inserted row.
  ///
  /// The returned [DwPhoneVerificationRequest] will have its `id` field set.
  Future<DwPhoneVerificationRequest> insertRow(
    _i1.Session session,
    DwPhoneVerificationRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DwPhoneVerificationRequest>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [DwPhoneVerificationRequest]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<DwPhoneVerificationRequest>> update(
    _i1.Session session,
    List<DwPhoneVerificationRequest> rows, {
    _i1.ColumnSelections<DwPhoneVerificationRequestTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DwPhoneVerificationRequest>(
      rows,
      columns: columns?.call(DwPhoneVerificationRequest.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DwPhoneVerificationRequest]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<DwPhoneVerificationRequest> updateRow(
    _i1.Session session,
    DwPhoneVerificationRequest row, {
    _i1.ColumnSelections<DwPhoneVerificationRequestTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DwPhoneVerificationRequest>(
      row,
      columns: columns?.call(DwPhoneVerificationRequest.t),
      transaction: transaction,
    );
  }

  /// Deletes all [DwPhoneVerificationRequest]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<DwPhoneVerificationRequest>> delete(
    _i1.Session session,
    List<DwPhoneVerificationRequest> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DwPhoneVerificationRequest>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [DwPhoneVerificationRequest].
  Future<DwPhoneVerificationRequest> deleteRow(
    _i1.Session session,
    DwPhoneVerificationRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DwPhoneVerificationRequest>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<DwPhoneVerificationRequest>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DwPhoneVerificationRequestTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DwPhoneVerificationRequest>(
      where: where(DwPhoneVerificationRequest.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DwPhoneVerificationRequestTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DwPhoneVerificationRequest>(
      where: where?.call(DwPhoneVerificationRequest.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class DwPhoneVerificationRequestAttachRowRepository {
  const DwPhoneVerificationRequestAttachRowRepository._();

  /// Creates a relation between the given [DwPhoneVerificationRequest] and [DwAuthDataStash]
  /// by setting the [DwPhoneVerificationRequest]'s foreign key `stashDataId` to refer to the [DwAuthDataStash].
  Future<void> stashData(
    _i1.Session session,
    DwPhoneVerificationRequest dwPhoneVerificationRequest,
    _i3.DwAuthDataStash stashData, {
    _i1.Transaction? transaction,
  }) async {
    if (dwPhoneVerificationRequest.id == null) {
      throw ArgumentError.notNull('dwPhoneVerificationRequest.id');
    }
    if (stashData.id == null) {
      throw ArgumentError.notNull('stashData.id');
    }

    var $dwPhoneVerificationRequest =
        dwPhoneVerificationRequest.copyWith(stashDataId: stashData.id);
    await session.db.updateRow<DwPhoneVerificationRequest>(
      $dwPhoneVerificationRequest,
      columns: [DwPhoneVerificationRequest.t.stashDataId],
      transaction: transaction,
    );
  }
}

class DwPhoneVerificationRequestDetachRowRepository {
  const DwPhoneVerificationRequestDetachRowRepository._();

  /// Detaches the relation between this [DwPhoneVerificationRequest] and the [DwAuthDataStash] set in `stashData`
  /// by setting the [DwPhoneVerificationRequest]'s foreign key `stashDataId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> stashData(
    _i1.Session session,
    DwPhoneVerificationRequest dwphoneverificationrequest, {
    _i1.Transaction? transaction,
  }) async {
    if (dwphoneverificationrequest.id == null) {
      throw ArgumentError.notNull('dwphoneverificationrequest.id');
    }

    var $dwphoneverificationrequest =
        dwphoneverificationrequest.copyWith(stashDataId: null);
    await session.db.updateRow<DwPhoneVerificationRequest>(
      $dwphoneverificationrequest,
      columns: [DwPhoneVerificationRequest.t.stashDataId],
      transaction: transaction,
    );
  }
}
