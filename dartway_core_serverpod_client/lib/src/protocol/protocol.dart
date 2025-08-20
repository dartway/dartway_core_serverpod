/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

import 'package:dartway_core_serverpod_client/src/extra_classes/dw_model_wrapper.dart'
    as _i8;
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

import '/src/extra_classes/dw_api_response.dart' as _i9;
import '/src/extra_classes/dw_backend_filter.dart' as _i10;
import '/src/extra_classes/dw_model_wrapper.dart' as _i7;
import 'dw_app_notification.dart' as _i2;
import 'dw_backend_filter_type.dart' as _i3;
import 'dw_updates_transport.dart' as _i4;
import 'media/dw_media.dart' as _i5;
import 'media/dw_media_type.dart' as _i6;

export 'client.dart';
export 'dw_app_notification.dart';
export 'dw_backend_filter_type.dart';
export 'dw_updates_transport.dart';
export 'media/dw_media.dart';
export 'media/dw_media_type.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (data is Map<String, dynamic>) {
      final manualDeserialization =
          _i9.DwApiResponse.manualDeserialization<T>(data);
      if (manualDeserialization != null) return manualDeserialization;
    }
    if (t == _i2.DwAppNotification) {
      return _i2.DwAppNotification.fromJson(data) as T;
    }
    if (t == _i3.DwBackendFilterType) {
      return _i3.DwBackendFilterType.fromJson(data) as T;
    }
    if (t == _i4.DwUpdatesTransport) {
      return _i4.DwUpdatesTransport.fromJson(data) as T;
    }
    if (t == _i5.DwMedia) {
      return _i5.DwMedia.fromJson(data) as T;
    }
    if (t == _i6.DwMediaType) {
      return _i6.DwMediaType.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.DwAppNotification?>()) {
      return (data != null ? _i2.DwAppNotification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.DwBackendFilterType?>()) {
      return (data != null ? _i3.DwBackendFilterType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i4.DwUpdatesTransport?>()) {
      return (data != null ? _i4.DwUpdatesTransport.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.DwMedia?>()) {
      return (data != null ? _i5.DwMedia.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.DwMediaType?>()) {
      return (data != null ? _i6.DwMediaType.fromJson(data) : null) as T;
    }
    if (t == List<_i7.DwModelWrapper>) {
      return (data as List)
          .map((e) => deserialize<_i7.DwModelWrapper>(e))
          .toList() as T;
    }
    if (t == _i7.DwModelWrapper) {
      return _i7.DwModelWrapper.fromJson(data) as T;
    }
    if (t == List<_i8.DwModelWrapper>) {
      return (data as List)
          .map((e) => deserialize<_i8.DwModelWrapper>(e))
          .toList() as T;
    }
    if (t == _i9.DwApiResponse) {
      return _i9.DwApiResponse.fromJson(data) as T;
    }
    if (t == _i10.DwBackendFilter) {
      return _i10.DwBackendFilter.fromJson(data) as T;
    }
    if (t == _i1.getType<_i7.DwModelWrapper?>()) {
      return (data != null ? _i7.DwModelWrapper.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.DwApiResponse?>()) {
      return (data != null ? _i9.DwApiResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.DwBackendFilter?>()) {
      return (data != null ? _i10.DwBackendFilter.fromJson(data) : null) as T;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i7.DwModelWrapper) {
      return 'DwModelWrapper';
    }
    if (data is _i9.DwApiResponse) {
      return 'DwApiResponse';
    }
    if (data is _i10.DwBackendFilter) {
      return 'DwBackendFilter';
    }
    if (data is _i2.DwAppNotification) {
      return 'DwAppNotification';
    }
    if (data is _i3.DwBackendFilterType) {
      return 'DwBackendFilterType';
    }
    if (data is _i4.DwUpdatesTransport) {
      return 'DwUpdatesTransport';
    }
    if (data is _i5.DwMedia) {
      return 'DwMedia';
    }
    if (data is _i6.DwMediaType) {
      return 'DwMediaType';
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
      return deserialize<_i7.DwModelWrapper>(data['data']);
    }
    if (dataClassName == 'DwApiResponse') {
      return deserialize<_i9.DwApiResponse>(data['data']);
    }
    if (dataClassName == 'DwBackendFilter') {
      return deserialize<_i10.DwBackendFilter>(data['data']);
    }
    if (dataClassName == 'DwAppNotification') {
      return deserialize<_i2.DwAppNotification>(data['data']);
    }
    if (dataClassName == 'DwBackendFilterType') {
      return deserialize<_i3.DwBackendFilterType>(data['data']);
    }
    if (dataClassName == 'DwUpdatesTransport') {
      return deserialize<_i4.DwUpdatesTransport>(data['data']);
    }
    if (dataClassName == 'DwMedia') {
      return deserialize<_i5.DwMedia>(data['data']);
    }
    if (dataClassName == 'DwMediaType') {
      return deserialize<_i6.DwMediaType>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
