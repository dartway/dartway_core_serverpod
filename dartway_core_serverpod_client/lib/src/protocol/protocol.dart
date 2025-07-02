/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dartway_core_serverpod_client/src/extra_classes/dw_model_wrapper.dart'
    as _i9;
import 'package:serverpod_client/serverpod_client.dart' as _i1;

import '/src/extra_classes/dw_api_response.dart' as _i10;
import '/src/extra_classes/dw_backend_filter.dart' as _i11;
import '/src/extra_classes/dw_model_wrapper.dart' as _i8;
import 'dw_app_notification.dart' as _i2;
import 'dw_backend_filter_type.dart' as _i3;
import 'dw_data_stash.dart' as _i4;
import 'dw_updates_transport.dart' as _i5;
import 'media/dw_media.dart' as _i6;
import 'media/dw_media_type.dart' as _i7;

export 'client.dart';
export 'dw_app_notification.dart';
export 'dw_backend_filter_type.dart';
export 'dw_data_stash.dart';
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
          _i10.DwApiResponse.manualDeserialization<T>(data);
      if (manualDeserialization != null) return manualDeserialization;
    }
    if (t == _i2.DwAppNotification) {
      return _i2.DwAppNotification.fromJson(data) as T;
    }
    if (t == _i3.DwBackendFilterType) {
      return _i3.DwBackendFilterType.fromJson(data) as T;
    }
    if (t == _i4.DwDataStash) {
      return _i4.DwDataStash.fromJson(data) as T;
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
    if (t == _i1.getType<_i2.DwAppNotification?>()) {
      return (data != null ? _i2.DwAppNotification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.DwBackendFilterType?>()) {
      return (data != null ? _i3.DwBackendFilterType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i4.DwDataStash?>()) {
      return (data != null ? _i4.DwDataStash.fromJson(data) : null) as T;
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
    if (t == Map<String, String>) {
      return (data as Map).map((k, v) =>
          MapEntry(deserialize<String>(k), deserialize<String>(v))) as dynamic;
    }
    if (t == List<_i8.DwModelWrapper>) {
      return (data as List)
          .map((e) => deserialize<_i8.DwModelWrapper>(e))
          .toList() as dynamic;
    }
    if (t == _i8.DwModelWrapper) {
      return _i8.DwModelWrapper.fromJson(data) as T;
    }
    if (t == List<_i9.DwModelWrapper>) {
      return (data as List)
          .map((e) => deserialize<_i9.DwModelWrapper>(e))
          .toList() as dynamic;
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
    if (data is _i2.DwAppNotification) {
      return 'DwAppNotification';
    }
    if (data is _i3.DwBackendFilterType) {
      return 'DwBackendFilterType';
    }
    if (data is _i4.DwDataStash) {
      return 'DwDataStash';
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
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'DwModelWrapper') {
      return deserialize<_i8.DwModelWrapper>(data['data']);
    }
    if (data['className'] == 'DwApiResponse') {
      return deserialize<_i10.DwApiResponse>(data['data']);
    }
    if (data['className'] == 'DwBackendFilter') {
      return deserialize<_i11.DwBackendFilter>(data['data']);
    }
    if (data['className'] == 'DwAppNotification') {
      return deserialize<_i2.DwAppNotification>(data['data']);
    }
    if (data['className'] == 'DwBackendFilterType') {
      return deserialize<_i3.DwBackendFilterType>(data['data']);
    }
    if (data['className'] == 'DwDataStash') {
      return deserialize<_i4.DwDataStash>(data['data']);
    }
    if (data['className'] == 'DwUpdatesTransport') {
      return deserialize<_i5.DwUpdatesTransport>(data['data']);
    }
    if (data['className'] == 'DwMedia') {
      return deserialize<_i6.DwMedia>(data['data']);
    }
    if (data['className'] == 'DwMediaType') {
      return deserialize<_i7.DwMediaType>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
