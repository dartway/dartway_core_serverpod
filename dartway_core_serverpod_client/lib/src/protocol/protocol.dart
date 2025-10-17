/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'auth/dw_auth_provider.dart' as _i2;
import 'auth/dw_auth_request.dart' as _i3;
import 'auth/dw_auth_request_status.dart' as _i4;
import 'auth/dw_auth_request_type.dart' as _i5;
import 'auth/dw_auth_verification.dart' as _i6;
import 'auth/dw_auth_verification_type.dart' as _i7;
import 'dw_app_notification.dart' as _i8;
import 'dw_backend_filter_type.dart' as _i9;
import 'dw_updates_transport.dart' as _i10;
import 'media/dw_media.dart' as _i11;
import 'media/dw_media_type.dart' as _i12;
import '/src/domain/extra_classes/dw_model_wrapper.dart' as _i13;
import 'package:dartway_core_serverpod_client/src/domain/extra_classes/dw_model_wrapper.dart'
    as _i14;
import '/src/domain/extra_classes/dw_api_response.dart' as _i15;
import '/src/domain/extra_classes/dw_backend_filter.dart' as _i16;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i17;
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
export 'client.dart';

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
          _i15.DwApiResponse.manualDeserialization<T>(data);
      if (manualDeserialization != null) return manualDeserialization;
    }
    if (t == _i2.DwAuthProvider) {
      return _i2.DwAuthProvider.fromJson(data) as T;
    }
    if (t == _i3.DwAuthRequest) {
      return _i3.DwAuthRequest.fromJson(data) as T;
    }
    if (t == _i4.DwAuthRequestStatus) {
      return _i4.DwAuthRequestStatus.fromJson(data) as T;
    }
    if (t == _i5.DwAuthRequestType) {
      return _i5.DwAuthRequestType.fromJson(data) as T;
    }
    if (t == _i6.DwAuthVerification) {
      return _i6.DwAuthVerification.fromJson(data) as T;
    }
    if (t == _i7.DwAuthVerificationType) {
      return _i7.DwAuthVerificationType.fromJson(data) as T;
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
    if (t == _i1.getType<_i2.DwAuthProvider?>()) {
      return (data != null ? _i2.DwAuthProvider.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.DwAuthRequest?>()) {
      return (data != null ? _i3.DwAuthRequest.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.DwAuthRequestStatus?>()) {
      return (data != null ? _i4.DwAuthRequestStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i5.DwAuthRequestType?>()) {
      return (data != null ? _i5.DwAuthRequestType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.DwAuthVerification?>()) {
      return (data != null ? _i6.DwAuthVerification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.DwAuthVerificationType?>()) {
      return (data != null ? _i7.DwAuthVerificationType.fromJson(data) : null)
          as T;
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
    if (t == List<_i13.DwModelWrapper>) {
      return (data as List)
          .map((e) => deserialize<_i13.DwModelWrapper>(e))
          .toList() as T;
    }
    if (t == _i13.DwModelWrapper) {
      return _i13.DwModelWrapper.fromJson(data) as T;
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
      return _i17.Protocol().deserialize<T>(data, t);
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
    if (data is _i2.DwAuthProvider) {
      return 'DwAuthProvider';
    }
    if (data is _i3.DwAuthRequest) {
      return 'DwAuthRequest';
    }
    if (data is _i4.DwAuthRequestStatus) {
      return 'DwAuthRequestStatus';
    }
    if (data is _i5.DwAuthRequestType) {
      return 'DwAuthRequestType';
    }
    if (data is _i6.DwAuthVerification) {
      return 'DwAuthVerification';
    }
    if (data is _i7.DwAuthVerificationType) {
      return 'DwAuthVerificationType';
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
    className = _i17.Protocol().getClassNameForObject(data);
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
    if (dataClassName == 'DwAuthProvider') {
      return deserialize<_i2.DwAuthProvider>(data['data']);
    }
    if (dataClassName == 'DwAuthRequest') {
      return deserialize<_i3.DwAuthRequest>(data['data']);
    }
    if (dataClassName == 'DwAuthRequestStatus') {
      return deserialize<_i4.DwAuthRequestStatus>(data['data']);
    }
    if (dataClassName == 'DwAuthRequestType') {
      return deserialize<_i5.DwAuthRequestType>(data['data']);
    }
    if (dataClassName == 'DwAuthVerification') {
      return deserialize<_i6.DwAuthVerification>(data['data']);
    }
    if (dataClassName == 'DwAuthVerificationType') {
      return deserialize<_i7.DwAuthVerificationType>(data['data']);
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
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i17.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
