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

abstract class DwDataStash implements _i1.SerializableModel {
  DwDataStash._({
    this.id,
    required this.identifier,
    required this.createdAt,
    required this.data,
  });

  factory DwDataStash({
    int? id,
    required String identifier,
    required DateTime createdAt,
    required Map<String, String> data,
  }) = _DwDataStashImpl;

  factory DwDataStash.fromJson(Map<String, dynamic> jsonSerialization) {
    return DwDataStash(
      id: jsonSerialization['id'] as int?,
      identifier: jsonSerialization['identifier'] as String,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      data: (jsonSerialization['data'] as Map).map((k, v) => MapEntry(
            k as String,
            v as String,
          )),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String identifier;

  DateTime createdAt;

  Map<String, String> data;

  DwDataStash copyWith({
    int? id,
    String? identifier,
    DateTime? createdAt,
    Map<String, String>? data,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'identifier': identifier,
      'createdAt': createdAt.toJson(),
      'data': data.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DwDataStashImpl extends DwDataStash {
  _DwDataStashImpl({
    int? id,
    required String identifier,
    required DateTime createdAt,
    required Map<String, String> data,
  }) : super._(
          id: id,
          identifier: identifier,
          createdAt: createdAt,
          data: data,
        );

  @override
  DwDataStash copyWith({
    Object? id = _Undefined,
    String? identifier,
    DateTime? createdAt,
    Map<String, String>? data,
  }) {
    return DwDataStash(
      id: id is int? ? id : this.id,
      identifier: identifier ?? this.identifier,
      createdAt: createdAt ?? this.createdAt,
      data: data ??
          this.data.map((
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
