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
import '../auth/dw_auth_request_status.dart' as _i2;
import '../auth/dw_auth_request_type.dart' as _i3;
import '../auth/dw_auth_provider.dart' as _i4;
import '../auth/dw_auth_verification_type.dart' as _i5;

abstract class DwAuthRequest
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  DwAuthRequest._({
    this.id,
    required this.requestType,
    required this.userIdentifier,
    required this.authProvider,
    this.verificationType,
    this.password,
    _i2.DwAuthRequestStatus? status,
    this.errorMessage,
    this.errorData,
    DateTime? createdAt,
    this.verifiedAt,
    required this.extraData,
  })  : status = status ?? _i2.DwAuthRequestStatus.pending,
        createdAt = createdAt ?? DateTime.now();

  factory DwAuthRequest({
    int? id,
    required _i3.DwAuthRequestType requestType,
    required String userIdentifier,
    required _i4.DwAuthProvider authProvider,
    _i5.DwAuthVerificationType? verificationType,
    String? password,
    _i2.DwAuthRequestStatus? status,
    String? errorMessage,
    Map<String, String>? errorData,
    DateTime? createdAt,
    DateTime? verifiedAt,
    required Map<String, String> extraData,
  }) = _DwAuthRequestImpl;

  factory DwAuthRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return DwAuthRequest(
      id: jsonSerialization['id'] as int?,
      requestType: _i3.DwAuthRequestType.fromJson(
          (jsonSerialization['requestType'] as String)),
      userIdentifier: jsonSerialization['userIdentifier'] as String,
      authProvider: _i4.DwAuthProvider.fromJson(
          (jsonSerialization['authProvider'] as String)),
      verificationType: jsonSerialization['verificationType'] == null
          ? null
          : _i5.DwAuthVerificationType.fromJson(
              (jsonSerialization['verificationType'] as int)),
      password: jsonSerialization['password'] as String?,
      status: _i2.DwAuthRequestStatus.fromJson(
          (jsonSerialization['status'] as String)),
      errorMessage: jsonSerialization['errorMessage'] as String?,
      errorData:
          (jsonSerialization['errorData'] as Map?)?.map((k, v) => MapEntry(
                k as String,
                v as String,
              )),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      verifiedAt: jsonSerialization['verifiedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['verifiedAt']),
      extraData: (jsonSerialization['extraData'] as Map).map((k, v) => MapEntry(
            k as String,
            v as String,
          )),
    );
  }

  static final t = DwAuthRequestTable();

  static const db = DwAuthRequestRepository._();

  @override
  int? id;

  _i3.DwAuthRequestType requestType;

  String userIdentifier;

  _i4.DwAuthProvider authProvider;

  _i5.DwAuthVerificationType? verificationType;

  String? password;

  _i2.DwAuthRequestStatus status;

  String? errorMessage;

  Map<String, String>? errorData;

  DateTime createdAt;

  DateTime? verifiedAt;

  Map<String, String> extraData;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [DwAuthRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DwAuthRequest copyWith({
    int? id,
    _i3.DwAuthRequestType? requestType,
    String? userIdentifier,
    _i4.DwAuthProvider? authProvider,
    _i5.DwAuthVerificationType? verificationType,
    String? password,
    _i2.DwAuthRequestStatus? status,
    String? errorMessage,
    Map<String, String>? errorData,
    DateTime? createdAt,
    DateTime? verifiedAt,
    Map<String, String>? extraData,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'requestType': requestType.toJson(),
      'userIdentifier': userIdentifier,
      'authProvider': authProvider.toJson(),
      if (verificationType != null)
        'verificationType': verificationType?.toJson(),
      if (password != null) 'password': password,
      'status': status.toJson(),
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (errorData != null) 'errorData': errorData?.toJson(),
      'createdAt': createdAt.toJson(),
      if (verifiedAt != null) 'verifiedAt': verifiedAt?.toJson(),
      'extraData': extraData.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'requestType': requestType.toJson(),
      'userIdentifier': userIdentifier,
      'authProvider': authProvider.toJson(),
      if (verificationType != null)
        'verificationType': verificationType?.toJson(),
      if (password != null) 'password': password,
      'status': status.toJson(),
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (errorData != null) 'errorData': errorData?.toJson(),
      'createdAt': createdAt.toJson(),
      if (verifiedAt != null) 'verifiedAt': verifiedAt?.toJson(),
      'extraData': extraData.toJson(),
    };
  }

  static DwAuthRequestInclude include() {
    return DwAuthRequestInclude._();
  }

  static DwAuthRequestIncludeList includeList({
    _i1.WhereExpressionBuilder<DwAuthRequestTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DwAuthRequestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DwAuthRequestTable>? orderByList,
    DwAuthRequestInclude? include,
  }) {
    return DwAuthRequestIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DwAuthRequest.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DwAuthRequest.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DwAuthRequestImpl extends DwAuthRequest {
  _DwAuthRequestImpl({
    int? id,
    required _i3.DwAuthRequestType requestType,
    required String userIdentifier,
    required _i4.DwAuthProvider authProvider,
    _i5.DwAuthVerificationType? verificationType,
    String? password,
    _i2.DwAuthRequestStatus? status,
    String? errorMessage,
    Map<String, String>? errorData,
    DateTime? createdAt,
    DateTime? verifiedAt,
    required Map<String, String> extraData,
  }) : super._(
          id: id,
          requestType: requestType,
          userIdentifier: userIdentifier,
          authProvider: authProvider,
          verificationType: verificationType,
          password: password,
          status: status,
          errorMessage: errorMessage,
          errorData: errorData,
          createdAt: createdAt,
          verifiedAt: verifiedAt,
          extraData: extraData,
        );

  /// Returns a shallow copy of this [DwAuthRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DwAuthRequest copyWith({
    Object? id = _Undefined,
    _i3.DwAuthRequestType? requestType,
    String? userIdentifier,
    _i4.DwAuthProvider? authProvider,
    Object? verificationType = _Undefined,
    Object? password = _Undefined,
    _i2.DwAuthRequestStatus? status,
    Object? errorMessage = _Undefined,
    Object? errorData = _Undefined,
    DateTime? createdAt,
    Object? verifiedAt = _Undefined,
    Map<String, String>? extraData,
  }) {
    return DwAuthRequest(
      id: id is int? ? id : this.id,
      requestType: requestType ?? this.requestType,
      userIdentifier: userIdentifier ?? this.userIdentifier,
      authProvider: authProvider ?? this.authProvider,
      verificationType: verificationType is _i5.DwAuthVerificationType?
          ? verificationType
          : this.verificationType,
      password: password is String? ? password : this.password,
      status: status ?? this.status,
      errorMessage: errorMessage is String? ? errorMessage : this.errorMessage,
      errorData: errorData is Map<String, String>?
          ? errorData
          : this.errorData?.map((
                key0,
                value0,
              ) =>
                  MapEntry(
                    key0,
                    value0,
                  )),
      createdAt: createdAt ?? this.createdAt,
      verifiedAt: verifiedAt is DateTime? ? verifiedAt : this.verifiedAt,
      extraData: extraData ??
          this.extraData.map((
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

class DwAuthRequestTable extends _i1.Table<int?> {
  DwAuthRequestTable({super.tableRelation})
      : super(tableName: 'dw_auth_request') {
    requestType = _i1.ColumnEnum(
      'requestType',
      this,
      _i1.EnumSerialization.byName,
    );
    userIdentifier = _i1.ColumnString(
      'userIdentifier',
      this,
    );
    authProvider = _i1.ColumnEnum(
      'authProvider',
      this,
      _i1.EnumSerialization.byName,
    );
    verificationType = _i1.ColumnEnum(
      'verificationType',
      this,
      _i1.EnumSerialization.byIndex,
    );
    status = _i1.ColumnEnum(
      'status',
      this,
      _i1.EnumSerialization.byName,
      hasDefault: true,
    );
    errorMessage = _i1.ColumnString(
      'errorMessage',
      this,
    );
    errorData = _i1.ColumnSerializable(
      'errorData',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    verifiedAt = _i1.ColumnDateTime(
      'verifiedAt',
      this,
    );
    extraData = _i1.ColumnSerializable(
      'extraData',
      this,
    );
  }

  late final _i1.ColumnEnum<_i3.DwAuthRequestType> requestType;

  late final _i1.ColumnString userIdentifier;

  late final _i1.ColumnEnum<_i4.DwAuthProvider> authProvider;

  late final _i1.ColumnEnum<_i5.DwAuthVerificationType> verificationType;

  late final _i1.ColumnEnum<_i2.DwAuthRequestStatus> status;

  late final _i1.ColumnString errorMessage;

  late final _i1.ColumnSerializable errorData;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime verifiedAt;

  late final _i1.ColumnSerializable extraData;

  @override
  List<_i1.Column> get columns => [
        id,
        requestType,
        userIdentifier,
        authProvider,
        verificationType,
        status,
        errorMessage,
        errorData,
        createdAt,
        verifiedAt,
        extraData,
      ];
}

class DwAuthRequestInclude extends _i1.IncludeObject {
  DwAuthRequestInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => DwAuthRequest.t;
}

class DwAuthRequestIncludeList extends _i1.IncludeList {
  DwAuthRequestIncludeList._({
    _i1.WhereExpressionBuilder<DwAuthRequestTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DwAuthRequest.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => DwAuthRequest.t;
}

class DwAuthRequestRepository {
  const DwAuthRequestRepository._();

  /// Returns a list of [DwAuthRequest]s matching the given query parameters.
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
  Future<List<DwAuthRequest>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DwAuthRequestTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DwAuthRequestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DwAuthRequestTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<DwAuthRequest>(
      where: where?.call(DwAuthRequest.t),
      orderBy: orderBy?.call(DwAuthRequest.t),
      orderByList: orderByList?.call(DwAuthRequest.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [DwAuthRequest] matching the given query parameters.
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
  Future<DwAuthRequest?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DwAuthRequestTable>? where,
    int? offset,
    _i1.OrderByBuilder<DwAuthRequestTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DwAuthRequestTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<DwAuthRequest>(
      where: where?.call(DwAuthRequest.t),
      orderBy: orderBy?.call(DwAuthRequest.t),
      orderByList: orderByList?.call(DwAuthRequest.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [DwAuthRequest] by its [id] or null if no such row exists.
  Future<DwAuthRequest?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<DwAuthRequest>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [DwAuthRequest]s in the list and returns the inserted rows.
  ///
  /// The returned [DwAuthRequest]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<DwAuthRequest>> insert(
    _i1.Session session,
    List<DwAuthRequest> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DwAuthRequest>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [DwAuthRequest] and returns the inserted row.
  ///
  /// The returned [DwAuthRequest] will have its `id` field set.
  Future<DwAuthRequest> insertRow(
    _i1.Session session,
    DwAuthRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DwAuthRequest>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [DwAuthRequest]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<DwAuthRequest>> update(
    _i1.Session session,
    List<DwAuthRequest> rows, {
    _i1.ColumnSelections<DwAuthRequestTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DwAuthRequest>(
      rows,
      columns: columns?.call(DwAuthRequest.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DwAuthRequest]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<DwAuthRequest> updateRow(
    _i1.Session session,
    DwAuthRequest row, {
    _i1.ColumnSelections<DwAuthRequestTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DwAuthRequest>(
      row,
      columns: columns?.call(DwAuthRequest.t),
      transaction: transaction,
    );
  }

  /// Deletes all [DwAuthRequest]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<DwAuthRequest>> delete(
    _i1.Session session,
    List<DwAuthRequest> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DwAuthRequest>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [DwAuthRequest].
  Future<DwAuthRequest> deleteRow(
    _i1.Session session,
    DwAuthRequest row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DwAuthRequest>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<DwAuthRequest>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DwAuthRequestTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DwAuthRequest>(
      where: where(DwAuthRequest.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DwAuthRequestTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DwAuthRequest>(
      where: where?.call(DwAuthRequest.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
