import 'package:serverpod/serverpod.dart';

class DwModelWrapper implements SerializableModel, ProtocolSerialization {
  static SerializationManagerServer get _protocol =>
      Serverpod.instance.serializationManager;

  static DwModelWrapper? wrap(SerializableModel? object) =>
      object != null ? DwModelWrapper(object: object) : null;

  static List<DwModelWrapper> wrapMany(List<SerializableModel?> objects) =>
      objects
          .where((e) => e != null)
          .map((object) => DwModelWrapper(object: object!))
          .toList();

  DwModelWrapper({
    required this.object,
  })  : className = _protocol.getClassNameForObject(object) ?? 'unknown',
        isDeleted = false;

  DwModelWrapper.deleted({
    required this.object,
  })  : className = _protocol.getClassNameForObject(object) ?? 'unknown',
        isDeleted = true;

  final String className;
  final SerializableModel object;
  final bool isDeleted;

  String get dwMappingClassname => className.split('.').last;

  factory DwModelWrapper.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return DwModelWrapper(
      object: _protocol.deserializeByClassName(jsonSerialization),
    );
  }

  @override
  toJson() {
    return {
      'className': className,
      'data': object.toJson(),
      'isDeleted': isDeleted,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'className': className,
      'data': object.toJson(),
      'isDeleted': isDeleted,
    };
  }

  DwModelWrapper copyWith({
    SerializableModel? object,
  }) {
    return DwModelWrapper(
      object: object ?? this.object,
    );
  }
}
