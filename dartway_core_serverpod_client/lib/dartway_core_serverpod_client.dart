import 'package:serverpod_client/serverpod_client.dart'
    show SerializationManager;

export 'package:serverpod_client/serverpod_client.dart';

export 'src/domain/dw_api_response.dart';
export 'src/domain/dw_backend_filter.dart';
export 'src/domain/dw_model_wrapper.dart';
export 'src/protocol/protocol.dart';

class DwCoreServerpodClient {
  static late final SerializationManager protocol;
}
