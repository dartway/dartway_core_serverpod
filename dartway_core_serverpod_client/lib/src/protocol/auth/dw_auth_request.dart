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
import '../auth/dw_auth_request_status.dart' as _i2;
import '../auth/dw_auth_request_type.dart' as _i3;
import '../auth/dw_auth_provider.dart' as _i4;
import '../auth/dw_auth_verification_type.dart' as _i5;

abstract class DwAuthRequest implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
