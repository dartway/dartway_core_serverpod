import 'package:dartway_core_serverpod_client/dartway_core_serverpod_client.dart';

export 'package:serverpod_client/serverpod_client.dart';

export 'src/extra_classes/dw_api_response.dart';
export 'src/extra_classes/dw_backend_filter.dart';
export 'src/extra_classes/dw_model_wrapper.dart';
export 'src/protocol/protocol.dart';

class DwCoreServerpodClient {
  static late final SerializationManager protocol;
}
