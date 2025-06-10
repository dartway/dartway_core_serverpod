/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '/src/extra_classes/dw_model_wrapper.dart' as _i2;

abstract class DwUpdatesTransport
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  DwUpdatesTransport._({required this.wrappedModelUpdates});

  factory DwUpdatesTransport(
          {required List<_i2.DwModelWrapper> wrappedModelUpdates}) =
      _DwUpdatesTransportImpl;

  factory DwUpdatesTransport.fromJson(Map<String, dynamic> jsonSerialization) {
    return DwUpdatesTransport(
        wrappedModelUpdates: (jsonSerialization['wrappedModelUpdates'] as List)
            .map((e) => _i2.DwModelWrapper.fromJson(e))
            .toList());
  }

  List<_i2.DwModelWrapper> wrappedModelUpdates;

  DwUpdatesTransport copyWith({List<_i2.DwModelWrapper>? wrappedModelUpdates});
  @override
  Map<String, dynamic> toJson() {
    return {
      'wrappedModelUpdates':
          wrappedModelUpdates.toJson(valueToJson: (v) => v.toJson())
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'wrappedModelUpdates':
          wrappedModelUpdates.toJson(valueToJson: (v) => v.toJsonForProtocol())
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _DwUpdatesTransportImpl extends DwUpdatesTransport {
  _DwUpdatesTransportImpl(
      {required List<_i2.DwModelWrapper> wrappedModelUpdates})
      : super._(wrappedModelUpdates: wrappedModelUpdates);

  @override
  DwUpdatesTransport copyWith({List<_i2.DwModelWrapper>? wrappedModelUpdates}) {
    return DwUpdatesTransport(
        wrappedModelUpdates: wrappedModelUpdates ??
            this.wrappedModelUpdates.map((e0) => e0.copyWith()).toList());
  }
}
