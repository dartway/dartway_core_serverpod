import 'package:dartway_core_serverpod_client/dartway_core_serverpod_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dw_entity_list_state_config.freezed.dart';

@freezed
class DwEntityListStateConfig with _$DwEntityListStateConfig {
  const factory DwEntityListStateConfig({
    DwBackendFilter? backendFilter,
    int? pageSize,
    Function(List<DwModelWrapper> wrappedModelUpdates)? customUpdatesListener,
  }) = _DwEntityListStateConfig;
}
