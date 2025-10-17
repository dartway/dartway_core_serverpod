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
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'auth/dw_auth_provider.dart' as _i4;
import 'auth/dw_auth_request.dart' as _i5;
import 'auth/dw_auth_request_status.dart' as _i6;
import 'auth/dw_auth_request_type.dart' as _i7;
import 'auth/dw_auth_verification.dart' as _i8;
import 'auth/dw_auth_verification_type.dart' as _i9;
import 'dw_app_notification.dart' as _i10;
import 'dw_backend_filter_type.dart' as _i11;
import 'dw_updates_transport.dart' as _i12;
import 'media/dw_media.dart' as _i13;
import 'media/dw_media_type.dart' as _i14;
import '/src/domain/extra_classes/dw_model_wrapper.dart' as _i15;
import 'package:dartway_core_serverpod_server/src/domain/extra_classes/dw_model_wrapper.dart'
    as _i16;
import '/src/domain/extra_classes/dw_api_response.dart' as _i17;
import '/src/domain/extra_classes/dw_backend_filter.dart' as _i18;
export 'auth/dw_auth_provider.dart';
export 'auth/dw_auth_request.dart';
export 'auth/dw_auth_request_status.dart';
export 'auth/dw_auth_request_type.dart';
export 'auth/dw_auth_verification.dart';
export 'auth/dw_auth_verification_type.dart';
export 'dw_app_notification.dart';
export 'dw_backend_filter_type.dart';
export 'dw_updates_transport.dart';
export 'media/dw_media.dart';
export 'media/dw_media_type.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'dw_app_notification',
      dartName: 'DwAppNotification',
      schema: 'public',
      module: 'dartway_core_serverpod',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'dw_app_notification_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'toUserId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'identifier',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'timestamp',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'body',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'goToPath',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'isRead',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'dw_app_notification_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'dw_auth_request',
      dartName: 'DwAuthRequest',
      schema: 'public',
      module: 'dartway_core_serverpod',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'dw_auth_request_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'requestType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:DwAuthRequestType',
        ),
        _i2.ColumnDefinition(
          name: 'userIdentifier',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'authProvider',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:DwAuthProvider',
        ),
        _i2.ColumnDefinition(
          name: 'verificationType',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'protocol:DwAuthVerificationType?',
        ),
        _i2.ColumnDefinition(
          name: 'verificationHash',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:DwAuthRequestStatus',
          columnDefault: '\'pending\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'errorMessage',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'errorData',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'Map<String,String>?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'verifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'extraData',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'Map<String,String>?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'dw_auth_request_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'dw_auth_verification',
      dartName: 'DwAuthVerification',
      schema: 'public',
      module: 'dartway_core_serverpod',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'dw_auth_verification_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'dwAuthRequestId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'accessToken',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'dw_auth_verification_fk_0',
          columns: ['dwAuthRequestId'],
          referenceTable: 'dw_auth_request',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'dw_auth_verification_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'dw_media',
      dartName: 'DwMedia',
      schema: 'public',
      module: 'dartway_core_serverpod',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'dw_media_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'protocol:DwMediaType',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'publicUrl',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'duration',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'dw_media_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i4.DwAuthProvider) {
      return _i4.DwAuthProvider.fromJson(data) as T;
    }
    if (t == _i5.DwAuthRequest) {
      return _i5.DwAuthRequest.fromJson(data) as T;
    }
    if (t == _i6.DwAuthRequestStatus) {
      return _i6.DwAuthRequestStatus.fromJson(data) as T;
    }
    if (t == _i7.DwAuthRequestType) {
      return _i7.DwAuthRequestType.fromJson(data) as T;
    }
    if (t == _i8.DwAuthVerification) {
      return _i8.DwAuthVerification.fromJson(data) as T;
    }
    if (t == _i9.DwAuthVerificationType) {
      return _i9.DwAuthVerificationType.fromJson(data) as T;
    }
    if (t == _i10.DwAppNotification) {
      return _i10.DwAppNotification.fromJson(data) as T;
    }
    if (t == _i11.DwBackendFilterType) {
      return _i11.DwBackendFilterType.fromJson(data) as T;
    }
    if (t == _i12.DwUpdatesTransport) {
      return _i12.DwUpdatesTransport.fromJson(data) as T;
    }
    if (t == _i13.DwMedia) {
      return _i13.DwMedia.fromJson(data) as T;
    }
    if (t == _i14.DwMediaType) {
      return _i14.DwMediaType.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.DwAuthProvider?>()) {
      return (data != null ? _i4.DwAuthProvider.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.DwAuthRequest?>()) {
      return (data != null ? _i5.DwAuthRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.DwAuthRequestStatus?>()) {
      return (data != null ? _i6.DwAuthRequestStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i7.DwAuthRequestType?>()) {
      return (data != null ? _i7.DwAuthRequestType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.DwAuthVerification?>()) {
      return (data != null ? _i8.DwAuthVerification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.DwAuthVerificationType?>()) {
      return (data != null ? _i9.DwAuthVerificationType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i10.DwAppNotification?>()) {
      return (data != null ? _i10.DwAppNotification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.DwBackendFilterType?>()) {
      return (data != null ? _i11.DwBackendFilterType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i12.DwUpdatesTransport?>()) {
      return (data != null ? _i12.DwUpdatesTransport.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i13.DwMedia?>()) {
      return (data != null ? _i13.DwMedia.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.DwMediaType?>()) {
      return (data != null ? _i14.DwMediaType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<Map<String, String>?>()) {
      return (data != null
          ? (data as Map).map((k, v) =>
              MapEntry(deserialize<String>(k), deserialize<String>(v)))
          : null) as T;
    }
    if (t == _i1.getType<Map<String, String>?>()) {
      return (data != null
          ? (data as Map).map((k, v) =>
              MapEntry(deserialize<String>(k), deserialize<String>(v)))
          : null) as T;
    }
    if (t == List<_i15.DwModelWrapper>) {
      return (data as List)
          .map((e) => deserialize<_i15.DwModelWrapper>(e))
          .toList() as T;
    }
    if (t == _i15.DwModelWrapper) {
      return _i15.DwModelWrapper.fromJson(data) as T;
    }
    if (t == List<_i16.DwModelWrapper>) {
      return (data as List)
          .map((e) => deserialize<_i16.DwModelWrapper>(e))
          .toList() as T;
    }
    if (t == _i17.DwApiResponse) {
      return _i17.DwApiResponse.fromJson(data) as T;
    }
    if (t == _i18.DwBackendFilter) {
      return _i18.DwBackendFilter.fromJson(data) as T;
    }
    if (t == _i1.getType<_i15.DwModelWrapper?>()) {
      return (data != null ? _i15.DwModelWrapper.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.DwApiResponse?>()) {
      return (data != null ? _i17.DwApiResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.DwBackendFilter?>()) {
      return (data != null ? _i18.DwBackendFilter.fromJson(data) : null) as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i15.DwModelWrapper) {
      return 'DwModelWrapper';
    }
    if (data is _i17.DwApiResponse) {
      return 'DwApiResponse';
    }
    if (data is _i18.DwBackendFilter) {
      return 'DwBackendFilter';
    }
    if (data is _i4.DwAuthProvider) {
      return 'DwAuthProvider';
    }
    if (data is _i5.DwAuthRequest) {
      return 'DwAuthRequest';
    }
    if (data is _i6.DwAuthRequestStatus) {
      return 'DwAuthRequestStatus';
    }
    if (data is _i7.DwAuthRequestType) {
      return 'DwAuthRequestType';
    }
    if (data is _i8.DwAuthVerification) {
      return 'DwAuthVerification';
    }
    if (data is _i9.DwAuthVerificationType) {
      return 'DwAuthVerificationType';
    }
    if (data is _i10.DwAppNotification) {
      return 'DwAppNotification';
    }
    if (data is _i11.DwBackendFilterType) {
      return 'DwBackendFilterType';
    }
    if (data is _i12.DwUpdatesTransport) {
      return 'DwUpdatesTransport';
    }
    if (data is _i13.DwMedia) {
      return 'DwMedia';
    }
    if (data is _i14.DwMediaType) {
      return 'DwMediaType';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'DwModelWrapper') {
      return deserialize<_i15.DwModelWrapper>(data['data']);
    }
    if (dataClassName == 'DwApiResponse') {
      return deserialize<_i17.DwApiResponse>(data['data']);
    }
    if (dataClassName == 'DwBackendFilter') {
      return deserialize<_i18.DwBackendFilter>(data['data']);
    }
    if (dataClassName == 'DwAuthProvider') {
      return deserialize<_i4.DwAuthProvider>(data['data']);
    }
    if (dataClassName == 'DwAuthRequest') {
      return deserialize<_i5.DwAuthRequest>(data['data']);
    }
    if (dataClassName == 'DwAuthRequestStatus') {
      return deserialize<_i6.DwAuthRequestStatus>(data['data']);
    }
    if (dataClassName == 'DwAuthRequestType') {
      return deserialize<_i7.DwAuthRequestType>(data['data']);
    }
    if (dataClassName == 'DwAuthVerification') {
      return deserialize<_i8.DwAuthVerification>(data['data']);
    }
    if (dataClassName == 'DwAuthVerificationType') {
      return deserialize<_i9.DwAuthVerificationType>(data['data']);
    }
    if (dataClassName == 'DwAppNotification') {
      return deserialize<_i10.DwAppNotification>(data['data']);
    }
    if (dataClassName == 'DwBackendFilterType') {
      return deserialize<_i11.DwBackendFilterType>(data['data']);
    }
    if (dataClassName == 'DwUpdatesTransport') {
      return deserialize<_i12.DwUpdatesTransport>(data['data']);
    }
    if (dataClassName == 'DwMedia') {
      return deserialize<_i13.DwMedia>(data['data']);
    }
    if (dataClassName == 'DwMediaType') {
      return deserialize<_i14.DwMediaType>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i5.DwAuthRequest:
        return _i5.DwAuthRequest.t;
      case _i8.DwAuthVerification:
        return _i8.DwAuthVerification.t;
      case _i10.DwAppNotification:
        return _i10.DwAppNotification.t;
      case _i13.DwMedia:
        return _i13.DwMedia.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'dartway_core_serverpod';
}
