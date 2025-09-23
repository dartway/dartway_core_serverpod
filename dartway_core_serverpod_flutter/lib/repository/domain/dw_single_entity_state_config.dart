import 'package:dartway_core_serverpod_client/dartway_core_serverpod_client.dart';

class DwSingleEntityStateConfig<Entity extends SerializableModel> {
  final DwBackendFilter backendFilter;
  final String? apiGroupOverride;
  final Entity? initialModel;

  const DwSingleEntityStateConfig._({
    required this.backendFilter,
    this.apiGroupOverride,
    this.initialModel,
  });

  factory DwSingleEntityStateConfig({
    int? id,
    DwBackendFilter? filter,
    String? apiGroupOverride,
    Entity? initialModel,
  }) {
    assert(
      id != null || filter != null,
      'Either id or filter must be provided',
    );

    final backendFilter =
        filter ??
        DwBackendFilter<int>.value(
          type: DwBackendFilterType.equals,
          fieldName: 'id',
          fieldValue: id!,
        );

    return DwSingleEntityStateConfig._(
      backendFilter: backendFilter,
      apiGroupOverride: apiGroupOverride,
      initialModel: initialModel,
    );
  }

  DwSingleEntityStateConfig<Entity> copyWith({
    DwBackendFilter? backendFilter,
    String? apiGroupOverride,
    Entity? initialModel,
  }) {
    return DwSingleEntityStateConfig<Entity>._(
      backendFilter: backendFilter ?? this.backendFilter,
      apiGroupOverride: apiGroupOverride ?? this.apiGroupOverride,
      initialModel: initialModel ?? this.initialModel,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DwSingleEntityStateConfig<Entity> &&
          backendFilter == other.backendFilter &&
          apiGroupOverride == other.apiGroupOverride &&
          initialModel == other.initialModel;

  @override
  int get hashCode =>
      backendFilter.hashCode ^
      apiGroupOverride.hashCode ^
      initialModel.hashCode;

  @override
  String toString() =>
      'DwSingleEntityStateConfig<$Entity>('
      'backendFilter: $backendFilter, '
      'apiGroupOverride: $apiGroupOverride, '
      'initialModel: $initialModel'
      ')';
}
