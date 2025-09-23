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
import 'auth/dw_auth_data_stash.dart' as _i2;
import 'auth/phone/dw_phone_failed_sign_in.dart' as _i3;
import 'auth/phone/dw_phone_verification_request.dart' as _i4;
import 'auth/phone/dw_phone_verification_request_type.dart' as _i5;
import 'dw_app_notification.dart' as _i6;
import 'dw_backend_filter_type.dart' as _i7;
import 'dw_updates_transport.dart' as _i8;
import 'media/dw_media.dart' as _i9;
import 'media/dw_media_type.dart' as _i10;
import '../domain/dw_model_wrapper.dart' as _i11;
import 'package:dartway_core_serverpod_client/src/domain/dw_model_wrapper.dart'
    as _i12;
import '../domain/dw_api_response.dart' as _i13;
import '../domain/dw_backend_filter.dart' as _i14;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i15;
export 'auth/dw_auth_data_stash.dart';
export 'auth/phone/dw_phone_failed_sign_in.dart';
export 'auth/phone/dw_phone_verification_request.dart';
export 'auth/phone/dw_phone_verification_request_type.dart';
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
          _i13.DwApiResponse.manualDeserialization<T>(data);
      if (manualDeserialization != null) return manualDeserialization;
    }
    if (t == _i2.DwAuthDataStash) {
      return _i2.DwAuthDataStash.fromJson(data) as T;
    }
    if (t == _i3.DwPhoneFailedSignIn) {
      return _i3.DwPhoneFailedSignIn.fromJson(data) as T;
    }
    if (t == _i4.DwPhoneVerificationRequest) {
      return _i4.DwPhoneVerificationRequest.fromJson(data) as T;
    }
    if (t == _i5.DwPhoneVerificationRequestType) {
      return _i5.DwPhoneVerificationRequestType.fromJson(data) as T;
    }
    if (t == _i6.DwAppNotification) {
      return _i6.DwAppNotification.fromJson(data) as T;
    }
    if (t == _i7.DwBackendFilterType) {
      return _i7.DwBackendFilterType.fromJson(data) as T;
    }
    if (t == _i8.DwUpdatesTransport) {
      return _i8.DwUpdatesTransport.fromJson(data) as T;
    }
    if (t == _i9.DwMedia) {
      return _i9.DwMedia.fromJson(data) as T;
    }
    if (t == _i10.DwMediaType) {
      return _i10.DwMediaType.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.DwAuthDataStash?>()) {
      return (data != null ? _i2.DwAuthDataStash.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.DwPhoneFailedSignIn?>()) {
      return (data != null ? _i3.DwPhoneFailedSignIn.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i4.DwPhoneVerificationRequest?>()) {
      return (data != null
          ? _i4.DwPhoneVerificationRequest.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i5.DwPhoneVerificationRequestType?>()) {
      return (data != null
          ? _i5.DwPhoneVerificationRequestType.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i6.DwAppNotification?>()) {
      return (data != null ? _i6.DwAppNotification.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.DwBackendFilterType?>()) {
      return (data != null ? _i7.DwBackendFilterType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i8.DwUpdatesTransport?>()) {
      return (data != null ? _i8.DwUpdatesTransport.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.DwMedia?>()) {
      return (data != null ? _i9.DwMedia.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.DwMediaType?>()) {
      return (data != null ? _i10.DwMediaType.fromJson(data) : null) as T;
    }
    if (t == Map<String, String>) {
      return (data as Map).map((k, v) =>
          MapEntry(deserialize<String>(k), deserialize<String>(v))) as T;
    }
    if (t == List<_i11.DwModelWrapper>) {
      return (data as List)
          .map((e) => deserialize<_i11.DwModelWrapper>(e))
          .toList() as T;
    }
    if (t == _i11.DwModelWrapper) {
      return _i11.DwModelWrapper.fromJson(data) as T;
    }
    if (t == _i1.getType<Map<String, String>?>()) {
      return (data != null
          ? (data as Map).map((k, v) =>
              MapEntry(deserialize<String>(k), deserialize<String>(v)))
          : null) as T;
    }
    if (t == List<_i12.DwModelWrapper>) {
      return (data as List)
          .map((e) => deserialize<_i12.DwModelWrapper>(e))
          .toList() as T;
    }
    if (t == _i13.DwApiResponse) {
      return _i13.DwApiResponse.fromJson(data) as T;
    }
    if (t == _i14.DwBackendFilter) {
      return _i14.DwBackendFilter.fromJson(data) as T;
    }
    if (t == _i1.getType<_i11.DwModelWrapper?>()) {
      return (data != null ? _i11.DwModelWrapper.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.DwApiResponse?>()) {
      return (data != null ? _i13.DwApiResponse.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.DwBackendFilter?>()) {
      return (data != null ? _i14.DwBackendFilter.fromJson(data) : null) as T;
    }
    try {
      return _i15.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i11.DwModelWrapper) {
      return 'DwModelWrapper';
    }
    if (data is _i13.DwApiResponse) {
      return 'DwApiResponse';
    }
    if (data is _i14.DwBackendFilter) {
      return 'DwBackendFilter';
    }
    if (data is _i2.DwAuthDataStash) {
      return 'DwAuthDataStash';
    }
    if (data is _i3.DwPhoneFailedSignIn) {
      return 'DwPhoneFailedSignIn';
    }
    if (data is _i4.DwPhoneVerificationRequest) {
      return 'DwPhoneVerificationRequest';
    }
    if (data is _i5.DwPhoneVerificationRequestType) {
      return 'DwPhoneVerificationRequestType';
    }
    if (data is _i6.DwAppNotification) {
      return 'DwAppNotification';
    }
    if (data is _i7.DwBackendFilterType) {
      return 'DwBackendFilterType';
    }
    if (data is _i8.DwUpdatesTransport) {
      return 'DwUpdatesTransport';
    }
    if (data is _i9.DwMedia) {
      return 'DwMedia';
    }
    if (data is _i10.DwMediaType) {
      return 'DwMediaType';
    }
    className = _i15.Protocol().getClassNameForObject(data);
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
      return deserialize<_i11.DwModelWrapper>(data['data']);
    }
    if (dataClassName == 'DwApiResponse') {
      return deserialize<_i13.DwApiResponse>(data['data']);
    }
    if (dataClassName == 'DwBackendFilter') {
      return deserialize<_i14.DwBackendFilter>(data['data']);
    }
    if (dataClassName == 'DwAuthDataStash') {
      return deserialize<_i2.DwAuthDataStash>(data['data']);
    }
    if (dataClassName == 'DwPhoneFailedSignIn') {
      return deserialize<_i3.DwPhoneFailedSignIn>(data['data']);
    }
    if (dataClassName == 'DwPhoneVerificationRequest') {
      return deserialize<_i4.DwPhoneVerificationRequest>(data['data']);
    }
    if (dataClassName == 'DwPhoneVerificationRequestType') {
      return deserialize<_i5.DwPhoneVerificationRequestType>(data['data']);
    }
    if (dataClassName == 'DwAppNotification') {
      return deserialize<_i6.DwAppNotification>(data['data']);
    }
    if (dataClassName == 'DwBackendFilterType') {
      return deserialize<_i7.DwBackendFilterType>(data['data']);
    }
    if (dataClassName == 'DwUpdatesTransport') {
      return deserialize<_i8.DwUpdatesTransport>(data['data']);
    }
    if (dataClassName == 'DwMedia') {
      return deserialize<_i9.DwMedia>(data['data']);
    }
    if (dataClassName == 'DwMediaType') {
      return deserialize<_i10.DwMediaType>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i15.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
