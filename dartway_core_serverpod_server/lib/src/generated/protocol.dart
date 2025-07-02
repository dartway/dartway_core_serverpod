/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'dw_app_notification.dart' as _i3;
import 'dw_backend_filter_type.dart' as _i4;
import 'dw_data_stash.dart' as _i5;
import 'dw_updates_transport.dart' as _i6;
import 'media/dw_media.dart' as _i7;
import 'media/dw_media_type.dart' as _i8;
import '/src/extra_classes/dw_model_wrapper.dart' as _i9;
import 'package:dartway_core_serverpod_server/src/extra_classes/dw_model_wrapper.dart'
    as _i10;
import '/src/extra_classes/dw_api_response.dart' as _i11;
import '/src/extra_classes/dw_backend_filter.dart' as _i12;
export 'dw_app_notification.dart';
export 'dw_backend_filter_type.dart';
export 'dw_data_stash.dart';
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
      name: 'dw_data_stash',
      dartName: 'DwDataStash',
      schema: 'public',
      module: 'dartway_core_serverpod',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'dw_data_stash_id_seq\'::regclass)',
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
          indexName: 'dw_data_stash_pkey',
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
    if (t == _i5.DwDataStash) {
      return _i5.DwDataStash.fromJson(data) as T;
    }
    if (t == _i6.DwUpdatesTransport) {
      return _i6.DwUpdatesTransport.fromJson(data) as T;
    }
    if (t == _i7.DwMedia) {
      return _i7.DwMedia.fromJson(data) as T;
    }
    if (t == _i8.DwMediaType) {
      return _i8.DwMediaType.fromJson(data) as T;
    }
    if (t == _i1.getType<_i3.DwAppNotification?>()) {
      return (data != null ? _i3.DwAppNotification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.DwBackendFilterType?>()) {
      return (data != null ? _i4.DwBackendFilterType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i5.DwDataStash?>()) {
      return (data != null ? _i5.DwDataStash.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.DwUpdatesTransport?>()) {
      return (data != null ? _i6.DwUpdatesTransport.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.DwMedia?>()) {
      return (data != null ? _i7.DwMedia.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.DwMediaType?>()) {
      return (data != null ? _i8.DwMediaType.fromJson(data) : null) as T;
    }
    if (t == Map<String, String>) {
      return (data as Map).map((k, v) =>
          MapEntry(deserialize<String>(k), deserialize<String>(v))) as dynamic;
    }
    if (t == List<_i9.DwModelWrapper>) {
      return (data as List)
          .map((e) => deserialize<_i9.DwModelWrapper>(e))
          .toList() as dynamic;
    }
    if (t == _i9.DwModelWrapper) {
      return _i9.DwModelWrapper.fromJson(data) as T;
    }
    if (t == List<_i10.DwModelWrapper>) {
      return (data as List)
          .map((e) => deserialize<_i10.DwModelWrapper>(e))
          .toList() as dynamic;
    }
    if (t == _i11.DwApiResponse) {
      return _i11.DwApiResponse.fromJson(data) as T;
    }
    if (t == _i12.DwBackendFilter) {
      return _i12.DwBackendFilter.fromJson(data) as T;
    }
    if (t == _i1.getType<_i9.DwModelWrapper?>()) {
      return (data != null ? _i9.DwModelWrapper.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.DwApiResponse?>()) {
      return (data != null ? _i11.DwApiResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.DwBackendFilter?>()) {
      return (data != null ? _i12.DwBackendFilter.fromJson(data) : null) as T;
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
    if (data is _i9.DwModelWrapper) {
      return 'DwModelWrapper';
    }
    if (data is _i11.DwApiResponse) {
      return 'DwApiResponse';
    }
    if (data is _i12.DwBackendFilter) {
      return 'DwBackendFilter';
    }
    if (data is _i3.DwAppNotification) {
      return 'DwAppNotification';
    }
    if (data is _i4.DwBackendFilterType) {
      return 'DwBackendFilterType';
    }
    if (data is _i5.DwDataStash) {
      return 'DwDataStash';
    }
    if (data is _i6.DwUpdatesTransport) {
      return 'DwUpdatesTransport';
    }
    if (data is _i7.DwMedia) {
      return 'DwMedia';
    }
    if (data is _i8.DwMediaType) {
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
    if (data['className'] == 'DwModelWrapper') {
      return deserialize<_i9.DwModelWrapper>(data['data']);
    }
    if (data['className'] == 'DwApiResponse') {
      return deserialize<_i11.DwApiResponse>(data['data']);
    }
    if (data['className'] == 'DwBackendFilter') {
      return deserialize<_i12.DwBackendFilter>(data['data']);
    }
    if (data['className'] == 'DwAppNotification') {
      return deserialize<_i3.DwAppNotification>(data['data']);
    }
    if (data['className'] == 'DwBackendFilterType') {
      return deserialize<_i4.DwBackendFilterType>(data['data']);
    }
    if (data['className'] == 'DwDataStash') {
      return deserialize<_i5.DwDataStash>(data['data']);
    }
    if (data['className'] == 'DwUpdatesTransport') {
      return deserialize<_i6.DwUpdatesTransport>(data['data']);
    }
    if (data['className'] == 'DwMedia') {
      return deserialize<_i7.DwMedia>(data['data']);
    }
    if (data['className'] == 'DwMediaType') {
      return deserialize<_i8.DwMediaType>(data['data']);
    }
    if (data['className'].startsWith('serverpod.')) {
      data['className'] = data['className'].substring(10);
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
      case _i5.DwDataStash:
        return _i5.DwDataStash.t;
      case _i7.DwMedia:
        return _i7.DwMedia.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'dartway_core_serverpod';
}
