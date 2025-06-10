import 'package:dartway_core_serverpod_client/dartway_core_serverpod_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dw_single_entity_state_config.freezed.dart';

@freezed
class DwSingleEntityStateConfig with _$DwSingleEntityStateConfig {
  const factory DwSingleEntityStateConfig({
    required DwBackendFilter backendFilter,
  }) = _DwSingleEntityStateConfig;
}
