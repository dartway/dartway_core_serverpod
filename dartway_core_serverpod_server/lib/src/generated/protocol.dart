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
import 'dw_app_notification.dart' as _i3;
import 'dw_backend_filter_type.dart' as _i4;
import 'dw_updates_transport.dart' as _i5;
import 'media/dw_media.dart' as _i6;
import 'media/dw_media_type.dart' as _i7;
import '/src/extra_classes/dw_model_wrapper.dart' as _i8;
import 'package:dartway_core_serverpod_server/src/extra_classes/dw_model_wrapper.dart'
    as _i9;
import '/src/extra_classes/dw_api_response.dart' as _i10;
import '/src/extra_classes/dw_backend_filter.dart' as _i11;
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
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i3.DwAppNotification) {
      return _i3.DwAppNotification.fromJson(data) as T;
    }
    if (t == _i4.DwBackendFilterType) {
      return _i4.DwBackendFilterType.fromJson(data) as T;
    }
    if (t == _i5.DwUpdatesTransport) {
      return _i5.DwUpdatesTransport.fromJson(data) as T;
    }
    if (t == _i6.DwMedia) {
      return _i6.DwMedia.fromJson(data) as T;
    }
    if (t == _i7.DwMediaType) {
      return _i7.DwMediaType.fromJson(data) as T;
    }
    if (t == _i1.getType<_i3.DwAppNotification?>()) {
      return (data != null ? _i3.DwAppNotification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.DwBackendFilterType?>()) {
      return (data != null ? _i4.DwBackendFilterType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i5.DwUpdatesTransport?>()) {
      return (data != null ? _i5.DwUpdatesTransport.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.DwMedia?>()) {
      return (data != null ? _i6.DwMedia.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.DwMediaType?>()) {
      return (data != null ? _i7.DwMediaType.fromJson(data) : null) as T;
    }
    if (t == List<_i8.DwModelWrapper>) {
      return (data as List)
          .map((e) => deserialize<_i8.DwModelWrapper>(e))
          .toList() as T;
    }
    if (t == _i8.DwModelWrapper) {
      return _i8.DwModelWrapper.fromJson(data) as T;
    }
    if (t == List<_i9.DwModelWrapper>) {
      return (data as List)
          .map((e) => deserialize<_i9.DwModelWrapper>(e))
          .toList() as T;
    }
    if (t == _i10.DwApiResponse) {
      return _i10.DwApiResponse.fromJson(data) as T;
    }
    if (t == _i11.DwBackendFilter) {
      return _i11.DwBackendFilter.fromJson(data) as T;
    }
    if (t == _i1.getType<_i8.DwModelWrapper?>()) {
      return (data != null ? _i8.DwModelWrapper.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.DwApiResponse?>()) {
      return (data != null ? _i10.DwApiResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.DwBackendFilter?>()) {
      return (data != null ? _i11.DwBackendFilter.fromJson(data) : null) as T;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i8.DwModelWrapper) {
      return 'DwModelWrapper';
    }
    if (data is _i10.DwApiResponse) {
      return 'DwApiResponse';
    }
    if (data is _i11.DwBackendFilter) {
      return 'DwBackendFilter';
    }
    if (data is _i3.DwAppNotification) {
      return 'DwAppNotification';
    }
    if (data is _i4.DwBackendFilterType) {
      return 'DwBackendFilterType';
    }
    if (data is _i5.DwUpdatesTransport) {
      return 'DwUpdatesTransport';
    }
    if (data is _i6.DwMedia) {
      return 'DwMedia';
    }
    if (data is _i7.DwMediaType) {
      return 'DwMediaType';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
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
      return deserialize<_i8.DwModelWrapper>(data['data']);
    }
    if (dataClassName == 'DwApiResponse') {
      return deserialize<_i10.DwApiResponse>(data['data']);
    }
    if (dataClassName == 'DwBackendFilter') {
      return deserialize<_i11.DwBackendFilter>(data['data']);
    }
    if (dataClassName == 'DwAppNotification') {
      return deserialize<_i3.DwAppNotification>(data['data']);
    }
    if (dataClassName == 'DwBackendFilterType') {
      return deserialize<_i4.DwBackendFilterType>(data['data']);
    }
    if (dataClassName == 'DwUpdatesTransport') {
      return deserialize<_i5.DwUpdatesTransport>(data['data']);
    }
    if (dataClassName == 'DwMedia') {
      return deserialize<_i6.DwMedia>(data['data']);
    }
    if (dataClassName == 'DwMediaType') {
      return deserialize<_i7.DwMediaType>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i3.DwAppNotification:
        return _i3.DwAppNotification.t;
      case _i6.DwMedia:
        return _i6.DwMedia.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'dartway_core_serverpod';
}
