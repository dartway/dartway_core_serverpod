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
import '../../auth/phone/dw_phone_verification_request_type.dart' as _i2;
import '../../auth/dw_auth_data_stash.dart' as _i3;

/// Database bindings for a sign in with phone.
abstract class DwPhoneVerificationRequest implements _i1.SerializableModel {
  DwPhoneVerificationRequest._({
    this.id,
    required this.requestType,
    required this.phoneNumber,
    required this.hash,
    DateTime? createdAt,
    required this.expirationTime,
    this.stashDataId,
    this.stashData,
    bool? isUsed,
  })  : createdAt = createdAt ?? DateTime.now(),
        isUsed = isUsed ?? false;

  factory DwPhoneVerificationRequest({
    int? id,
    required _i2.DwPhoneVerificationRequestType requestType,
    required String phoneNumber,
    required String hash,
    DateTime? createdAt,
    required DateTime expirationTime,
    int? stashDataId,
    _i3.DwAuthDataStash? stashData,
    bool? isUsed,
  }) = _DwPhoneVerificationRequestImpl;

  factory DwPhoneVerificationRequest.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return DwPhoneVerificationRequest(
      id: jsonSerialization['id'] as int?,
      requestType: _i2.DwPhoneVerificationRequestType.fromJson(
          (jsonSerialization['requestType'] as String)),
      phoneNumber: jsonSerialization['phoneNumber'] as String,
      hash: jsonSerialization['hash'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      expirationTime: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['expirationTime']),
      stashDataId: jsonSerialization['stashDataId'] as int?,
      stashData: jsonSerialization['stashData'] == null
          ? null
          : _i3.DwAuthDataStash.fromJson(
              (jsonSerialization['stashData'] as Map<String, dynamic>)),
      isUsed: jsonSerialization['isUsed'] as bool,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// The type of request, e.g. registration, signIn, passwordReset, changePhoneNumber, other
  /// See [DwPhoneVerificationRequestType](dw_phone_verification_request_type.spy.yaml)
  _i2.DwPhoneVerificationRequestType requestType;

  /// The phoneNumber for verification
  String phoneNumber;

  /// The hashed otp
  String hash;

  /// The expiration time of the otp
  DateTime createdAt;

  DateTime expirationTime;

  int? stashDataId;

  _i3.DwAuthDataStash? stashData;

  /// If the otp has been used
  bool isUsed;

  /// Returns a shallow copy of this [DwPhoneVerificationRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DwPhoneVerificationRequest copyWith({
    int? id,
    _i2.DwPhoneVerificationRequestType? requestType,
    String? phoneNumber,
    String? hash,
    DateTime? createdAt,
    DateTime? expirationTime,
    int? stashDataId,
    _i3.DwAuthDataStash? stashData,
    bool? isUsed,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'requestType': requestType.toJson(),
      'phoneNumber': phoneNumber,
      'hash': hash,
      'createdAt': createdAt.toJson(),
      'expirationTime': expirationTime.toJson(),
      if (stashDataId != null) 'stashDataId': stashDataId,
      if (stashData != null) 'stashData': stashData?.toJson(),
      'isUsed': isUsed,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DwPhoneVerificationRequestImpl extends DwPhoneVerificationRequest {
  _DwPhoneVerificationRequestImpl({
    int? id,
    required _i2.DwPhoneVerificationRequestType requestType,
    required String phoneNumber,
    required String hash,
    DateTime? createdAt,
    required DateTime expirationTime,
    int? stashDataId,
    _i3.DwAuthDataStash? stashData,
    bool? isUsed,
  }) : super._(
          id: id,
          requestType: requestType,
          phoneNumber: phoneNumber,
          hash: hash,
          createdAt: createdAt,
          expirationTime: expirationTime,
          stashDataId: stashDataId,
          stashData: stashData,
          isUsed: isUsed,
        );

  /// Returns a shallow copy of this [DwPhoneVerificationRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DwPhoneVerificationRequest copyWith({
    Object? id = _Undefined,
    _i2.DwPhoneVerificationRequestType? requestType,
    String? phoneNumber,
    String? hash,
    DateTime? createdAt,
    DateTime? expirationTime,
    Object? stashDataId = _Undefined,
    Object? stashData = _Undefined,
    bool? isUsed,
  }) {
    return DwPhoneVerificationRequest(
      id: id is int? ? id : this.id,
      requestType: requestType ?? this.requestType,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      hash: hash ?? this.hash,
      createdAt: createdAt ?? this.createdAt,
      expirationTime: expirationTime ?? this.expirationTime,
      stashDataId: stashDataId is int? ? stashDataId : this.stashDataId,
      stashData: stashData is _i3.DwAuthDataStash?
          ? stashData
          : this.stashData?.copyWith(),
      isUsed: isUsed ?? this.isUsed,
    );
  }
}
