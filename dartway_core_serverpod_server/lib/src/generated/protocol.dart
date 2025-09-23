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
import 'auth/dw_auth_data_stash.dart' as _i4;
import 'auth/phone/dw_phone_failed_sign_in.dart' as _i5;
import 'auth/phone/dw_phone_verification_request.dart' as _i6;
import 'auth/phone/dw_phone_verification_request_type.dart' as _i7;
import 'dw_app_notification.dart' as _i8;
import 'dw_backend_filter_type.dart' as _i9;
import 'dw_updates_transport.dart' as _i10;
import 'media/dw_media.dart' as _i11;
import 'media/dw_media_type.dart' as _i12;
import '/src/domain/dw_model_wrapper.dart' as _i13;
import 'package:dartway_core_serverpod_server/src/domain/dw_model_wrapper.dart'
    as _i14;
import '/src/domain/dw_api_response.dart' as _i15;
import '/src/domain/dw_backend_filter.dart' as _i16;
export 'auth/dw_auth_data_stash.dart';
export 'auth/phone/dw_phone_failed_sign_in.dart';
export 'auth/phone/dw_phone_verification_request.dart';
export 'auth/phone/dw_phone_verification_request_type.dart';
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
      name: 'dw_auth_data_stash',
      dartName: 'DwAuthDataStash',
      schema: 'public',
      module: 'dartway_core_serverpod',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'dw_auth_data_stash_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'identifier',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'data',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'Map<String,String>',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'dw_auth_data_stash_pkey',
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
    _i2.TableDefinition(
      name: 'dw_phone_failed_sign_in',
      dartName: 'DwPhoneFailedSignIn',
      schema: 'public',
      module: 'dartway_core_serverpod',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'dw_phone_failed_sign_in_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'phoneNumber',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'time',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'ipAddress',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'dw_phone_failed_sign_in_pkey',
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
        ),
        _i2.IndexDefinition(
          indexName: 'serverpod_phone_failed_sign_in_email_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'phoneNumber',
            )
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'serverpod_phone_failed_sign_in_time_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'time',
            )
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'dw_phone_verification_request',
      dartName: 'DwPhoneVerificationRequest',
      schema: 'public',
      module: 'dartway_core_serverpod',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'dw_phone_verification_request_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'requestType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:DwPhoneVerificationRequestType',
        ),
        _i2.ColumnDefinition(
          name: 'phoneNumber',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'hash',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'expirationTime',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'stashDataId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'isUsed',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'dw_phone_verification_request_fk_0',
          columns: ['stashDataId'],
          referenceTable: 'dw_auth_data_stash',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'dw_phone_verification_request_pkey',
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
        ),
        _i2.IndexDefinition(
          indexName: 'serverpod_phone_auth_phone',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'phoneNumber',
            )
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
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
    if (t == _i4.DwAuthDataStash) {
      return _i4.DwAuthDataStash.fromJson(data) as T;
    }
    if (t == _i5.DwPhoneFailedSignIn) {
      return _i5.DwPhoneFailedSignIn.fromJson(data) as T;
    }
    if (t == _i6.DwPhoneVerificationRequest) {
      return _i6.DwPhoneVerificationRequest.fromJson(data) as T;
    }
    if (t == _i7.DwPhoneVerificationRequestType) {
      return _i7.DwPhoneVerificationRequestType.fromJson(data) as T;
    }
    if (t == _i8.DwAppNotification) {
      return _i8.DwAppNotification.fromJson(data) as T;
    }
    if (t == _i9.DwBackendFilterType) {
      return _i9.DwBackendFilterType.fromJson(data) as T;
    }
    if (t == _i10.DwUpdatesTransport) {
      return _i10.DwUpdatesTransport.fromJson(data) as T;
    }
    if (t == _i11.DwMedia) {
      return _i11.DwMedia.fromJson(data) as T;
    }
    if (t == _i12.DwMediaType) {
      return _i12.DwMediaType.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.DwAuthDataStash?>()) {
      return (data != null ? _i4.DwAuthDataStash.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.DwPhoneFailedSignIn?>()) {
      return (data != null ? _i5.DwPhoneFailedSignIn.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i6.DwPhoneVerificationRequest?>()) {
      return (data != null
          ? _i6.DwPhoneVerificationRequest.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i7.DwPhoneVerificationRequestType?>()) {
      return (data != null
          ? _i7.DwPhoneVerificationRequestType.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i8.DwAppNotification?>()) {
      return (data != null ? _i8.DwAppNotification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.DwBackendFilterType?>()) {
      return (data != null ? _i9.DwBackendFilterType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i10.DwUpdatesTransport?>()) {
      return (data != null ? _i10.DwUpdatesTransport.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i11.DwMedia?>()) {
      return (data != null ? _i11.DwMedia.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.DwMediaType?>()) {
      return (data != null ? _i12.DwMediaType.fromJson(data) : null) as T;
    }
    if (t == Map<String, String>) {
      return (data as Map).map((k, v) =>
          MapEntry(deserialize<String>(k), deserialize<String>(v))) as T;
    }
    if (t == List<_i13.DwModelWrapper>) {
      return (data as List)
          .map((e) => deserialize<_i13.DwModelWrapper>(e))
          .toList() as T;
    }
    if (t == _i13.DwModelWrapper) {
      return _i13.DwModelWrapper.fromJson(data) as T;
    }
    if (t == _i1.getType<Map<String, String>?>()) {
      return (data != null
          ? (data as Map).map((k, v) =>
              MapEntry(deserialize<String>(k), deserialize<String>(v)))
          : null) as T;
    }
    if (t == List<_i14.DwModelWrapper>) {
      return (data as List)
          .map((e) => deserialize<_i14.DwModelWrapper>(e))
          .toList() as T;
    }
    if (t == _i15.DwApiResponse) {
      return _i15.DwApiResponse.fromJson(data) as T;
    }
    if (t == _i16.DwBackendFilter) {
      return _i16.DwBackendFilter.fromJson(data) as T;
    }
    if (t == _i1.getType<_i13.DwModelWrapper?>()) {
      return (data != null ? _i13.DwModelWrapper.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.DwApiResponse?>()) {
      return (data != null ? _i15.DwApiResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.DwBackendFilter?>()) {
      return (data != null ? _i16.DwBackendFilter.fromJson(data) : null) as T;
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
    if (data is _i13.DwModelWrapper) {
      return 'DwModelWrapper';
    }
    if (data is _i15.DwApiResponse) {
      return 'DwApiResponse';
    }
    if (data is _i16.DwBackendFilter) {
      return 'DwBackendFilter';
    }
    if (data is _i4.DwAuthDataStash) {
      return 'DwAuthDataStash';
    }
    if (data is _i5.DwPhoneFailedSignIn) {
      return 'DwPhoneFailedSignIn';
    }
    if (data is _i6.DwPhoneVerificationRequest) {
      return 'DwPhoneVerificationRequest';
    }
    if (data is _i7.DwPhoneVerificationRequestType) {
      return 'DwPhoneVerificationRequestType';
    }
    if (data is _i8.DwAppNotification) {
      return 'DwAppNotification';
    }
    if (data is _i9.DwBackendFilterType) {
      return 'DwBackendFilterType';
    }
    if (data is _i10.DwUpdatesTransport) {
      return 'DwUpdatesTransport';
    }
    if (data is _i11.DwMedia) {
      return 'DwMedia';
    }
    if (data is _i12.DwMediaType) {
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
      return deserialize<_i13.DwModelWrapper>(data['data']);
    }
    if (dataClassName == 'DwApiResponse') {
      return deserialize<_i15.DwApiResponse>(data['data']);
    }
    if (dataClassName == 'DwBackendFilter') {
      return deserialize<_i16.DwBackendFilter>(data['data']);
    }
    if (dataClassName == 'DwAuthDataStash') {
      return deserialize<_i4.DwAuthDataStash>(data['data']);
    }
    if (dataClassName == 'DwPhoneFailedSignIn') {
      return deserialize<_i5.DwPhoneFailedSignIn>(data['data']);
    }
    if (dataClassName == 'DwPhoneVerificationRequest') {
      return deserialize<_i6.DwPhoneVerificationRequest>(data['data']);
    }
    if (dataClassName == 'DwPhoneVerificationRequestType') {
      return deserialize<_i7.DwPhoneVerificationRequestType>(data['data']);
    }
    if (dataClassName == 'DwAppNotification') {
      return deserialize<_i8.DwAppNotification>(data['data']);
    }
    if (dataClassName == 'DwBackendFilterType') {
      return deserialize<_i9.DwBackendFilterType>(data['data']);
    }
    if (dataClassName == 'DwUpdatesTransport') {
      return deserialize<_i10.DwUpdatesTransport>(data['data']);
    }
    if (dataClassName == 'DwMedia') {
      return deserialize<_i11.DwMedia>(data['data']);
    }
    if (dataClassName == 'DwMediaType') {
      return deserialize<_i12.DwMediaType>(data['data']);
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
      case _i4.DwAuthDataStash:
        return _i4.DwAuthDataStash.t;
      case _i5.DwPhoneFailedSignIn:
        return _i5.DwPhoneFailedSignIn.t;
      case _i6.DwPhoneVerificationRequest:
        return _i6.DwPhoneVerificationRequest.t;
      case _i8.DwAppNotification:
        return _i8.DwAppNotification.t;
      case _i11.DwMedia:
        return _i11.DwMedia.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'dartway_core_serverpod';
}
