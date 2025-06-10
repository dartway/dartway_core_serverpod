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

abstract class DwAppNotification
    implements _i1.TableRow, _i1.ProtocolSerialization {
  DwAppNotification._({
    this.id,
    required this.toUserId,
    this.identifier,
    DateTime? timestamp,
    required this.title,
    this.body,
    this.goToPath,
    bool? isRead,
  })  : timestamp = timestamp ?? DateTime.now(),
        isRead = isRead ?? false;

  factory DwAppNotification({
    int? id,
    required int toUserId,
    String? identifier,
    DateTime? timestamp,
    required String title,
    String? body,
    String? goToPath,
    bool? isRead,
  }) = _DwAppNotificationImpl;

  factory DwAppNotification.fromJson(Map<String, dynamic> jsonSerialization) {
    return DwAppNotification(
      id: jsonSerialization['id'] as int?,
      toUserId: jsonSerialization['toUserId'] as int,
      identifier: jsonSerialization['identifier'] as String?,
      timestamp:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['timestamp']),
      title: jsonSerialization['title'] as String,
      body: jsonSerialization['body'] as String?,
      goToPath: jsonSerialization['goToPath'] as String?,
      isRead: jsonSerialization['isRead'] as bool,
    );
  }

  static final t = DwAppNotificationTable();

  static const db = DwAppNotificationRepository._();

  @override
  int? id;

  int toUserId;

  String? identifier;

  DateTime timestamp;

  String title;

  String? body;

  String? goToPath;

  bool isRead;

  @override
  _i1.Table get table => t;

  DwAppNotification copyWith({
    int? id,
    int? toUserId,
    String? identifier,
    DateTime? timestamp,
    String? title,
    String? body,
    String? goToPath,
    bool? isRead,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'toUserId': toUserId,
      if (identifier != null) 'identifier': identifier,
      'timestamp': timestamp.toJson(),
      'title': title,
      if (body != null) 'body': body,
      if (goToPath != null) 'goToPath': goToPath,
      'isRead': isRead,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'toUserId': toUserId,
      if (identifier != null) 'identifier': identifier,
      'timestamp': timestamp.toJson(),
      'title': title,
      if (body != null) 'body': body,
      if (goToPath != null) 'goToPath': goToPath,
      'isRead': isRead,
    };
  }

  static DwAppNotificationInclude include() {
    return DwAppNotificationInclude._();
  }

  static DwAppNotificationIncludeList includeList({
    _i1.WhereExpressionBuilder<DwAppNotificationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DwAppNotificationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DwAppNotificationTable>? orderByList,
    DwAppNotificationInclude? include,
  }) {
    return DwAppNotificationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DwAppNotification.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DwAppNotification.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DwAppNotificationImpl extends DwAppNotification {
  _DwAppNotificationImpl({
    int? id,
    required int toUserId,
    String? identifier,
    DateTime? timestamp,
    required String title,
    String? body,
    String? goToPath,
    bool? isRead,
  }) : super._(
          id: id,
          toUserId: toUserId,
          identifier: identifier,
          timestamp: timestamp,
          title: title,
          body: body,
          goToPath: goToPath,
          isRead: isRead,
        );

  @override
  DwAppNotification copyWith({
    Object? id = _Undefined,
    int? toUserId,
    Object? identifier = _Undefined,
    DateTime? timestamp,
    String? title,
    Object? body = _Undefined,
    Object? goToPath = _Undefined,
    bool? isRead,
  }) {
    return DwAppNotification(
      id: id is int? ? id : this.id,
      toUserId: toUserId ?? this.toUserId,
      identifier: identifier is String? ? identifier : this.identifier,
      timestamp: timestamp ?? this.timestamp,
      title: title ?? this.title,
      body: body is String? ? body : this.body,
      goToPath: goToPath is String? ? goToPath : this.goToPath,
      isRead: isRead ?? this.isRead,
    );
  }
}

class DwAppNotificationTable extends _i1.Table {
  DwAppNotificationTable({super.tableRelation})
      : super(tableName: 'dw_app_notification') {
    toUserId = _i1.ColumnInt(
      'toUserId',
      this,
    );
    identifier = _i1.ColumnString(
      'identifier',
      this,
    );
    timestamp = _i1.ColumnDateTime(
      'timestamp',
      this,
      hasDefault: true,
    );
    title = _i1.ColumnString(
      'title',
      this,
    );
    body = _i1.ColumnString(
      'body',
      this,
    );
    goToPath = _i1.ColumnString(
      'goToPath',
      this,
    );
    isRead = _i1.ColumnBool(
      'isRead',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnInt toUserId;

  late final _i1.ColumnString identifier;

  late final _i1.ColumnDateTime timestamp;

  late final _i1.ColumnString title;

  late final _i1.ColumnString body;

  late final _i1.ColumnString goToPath;

  late final _i1.ColumnBool isRead;

  @override
  List<_i1.Column> get columns => [
        id,
        toUserId,
        identifier,
        timestamp,
        title,
        body,
        goToPath,
        isRead,
      ];
}

class DwAppNotificationInclude extends _i1.IncludeObject {
  DwAppNotificationInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => DwAppNotification.t;
}

class DwAppNotificationIncludeList extends _i1.IncludeList {
  DwAppNotificationIncludeList._({
    _i1.WhereExpressionBuilder<DwAppNotificationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DwAppNotification.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => DwAppNotification.t;
}

class DwAppNotificationRepository {
  const DwAppNotificationRepository._();

  Future<List<DwAppNotification>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DwAppNotificationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DwAppNotificationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DwAppNotificationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<DwAppNotification>(
      where: where?.call(DwAppNotification.t),
      orderBy: orderBy?.call(DwAppNotification.t),
      orderByList: orderByList?.call(DwAppNotification.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<DwAppNotification?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DwAppNotificationTable>? where,
    int? offset,
    _i1.OrderByBuilder<DwAppNotificationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DwAppNotificationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<DwAppNotification>(
      where: where?.call(DwAppNotification.t),
      orderBy: orderBy?.call(DwAppNotification.t),
      orderByList: orderByList?.call(DwAppNotification.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<DwAppNotification?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<DwAppNotification>(
      id,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<DwAppNotification>> insert(
    _i1.Session session,
    List<DwAppNotification> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DwAppNotification>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<DwAppNotification> insertRow(
    _i1.Session session,
    DwAppNotification row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DwAppNotification>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<DwAppNotification>> update(
    _i1.Session session,
    List<DwAppNotification> rows, {
    _i1.ColumnSelections<DwAppNotificationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DwAppNotification>(
      rows,
      columns: columns?.call(DwAppNotification.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<DwAppNotification> updateRow(
    _i1.Session session,
    DwAppNotification row, {
    _i1.ColumnSelections<DwAppNotificationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DwAppNotification>(
      row,
      columns: columns?.call(DwAppNotification.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<DwAppNotification>> delete(
    _i1.Session session,
    List<DwAppNotification> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DwAppNotification>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<DwAppNotification> deleteRow(
    _i1.Session session,
    DwAppNotification row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DwAppNotification>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<DwAppNotification>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DwAppNotificationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DwAppNotification>(
      where: where(DwAppNotification.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DwAppNotificationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DwAppNotification>(
      where: where?.call(DwAppNotification.t),
      limit: limit,
      transaction: transaction ?? session.transaction,
    );
  }
}
