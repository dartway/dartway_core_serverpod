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

/// Database table for tracking failed email sign-ins. Saves IP-address, time,
/// and email to be prevent brute force attacks.
abstract class DwPhoneFailedSignIn implements _i1.SerializableModel {
  DwPhoneFailedSignIn._({
    this.id,
    required this.phoneNumber,
    required this.time,
    required this.ipAddress,
  });

  factory DwPhoneFailedSignIn({
    int? id,
    required String phoneNumber,
    required DateTime time,
    required String ipAddress,
  }) = _DwPhoneFailedSignInImpl;

  factory DwPhoneFailedSignIn.fromJson(Map<String, dynamic> jsonSerialization) {
    return DwPhoneFailedSignIn(
      id: jsonSerialization['id'] as int?,
      phoneNumber: jsonSerialization['phoneNumber'] as String,
      time: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['time']),
      ipAddress: jsonSerialization['ipAddress'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// Email attempting to sign in with.
  String phoneNumber;

  /// The time of the sign in attempt.
  DateTime time;

  /// The IP address of the sign in attempt.
  String ipAddress;

  /// Returns a shallow copy of this [DwPhoneFailedSignIn]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DwPhoneFailedSignIn copyWith({
    int? id,
    String? phoneNumber,
    DateTime? time,
    String? ipAddress,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'phoneNumber': phoneNumber,
      'time': time.toJson(),
      'ipAddress': ipAddress,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DwPhoneFailedSignInImpl extends DwPhoneFailedSignIn {
  _DwPhoneFailedSignInImpl({
    int? id,
    required String phoneNumber,
    required DateTime time,
    required String ipAddress,
  }) : super._(
          id: id,
          phoneNumber: phoneNumber,
          time: time,
          ipAddress: ipAddress,
        );

  /// Returns a shallow copy of this [DwPhoneFailedSignIn]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DwPhoneFailedSignIn copyWith({
    Object? id = _Undefined,
    String? phoneNumber,
    DateTime? time,
    String? ipAddress,
  }) {
    return DwPhoneFailedSignIn(
      id: id is int? ? id : this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      time: time ?? this.time,
      ipAddress: ipAddress ?? this.ipAddress,
    );
  }
}
