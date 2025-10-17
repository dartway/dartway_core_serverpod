import 'package:serverpod_client/serverpod_client.dart'
    show SerializationManager;

export 'package:serverpod_client/serverpod_client.dart';

export 'src/domain/extra_classes/dw_api_response.dart';
export 'src/domain/extra_classes/dw_backend_filter.dart';
export 'src/domain/extra_classes/dw_model_wrapper.dart';
export 'src/protocol/dw_backend_filter_type.dart';
export 'src/protocol/auth/dw_auth_provider.dart';
export 'src/protocol/auth/dw_auth_request.dart';
export 'src/protocol/auth/dw_auth_request_status.dart';
export 'src/protocol/auth/dw_auth_request_type.dart';
export 'src/protocol/auth/dw_auth_verification.dart';
export 'src/protocol/auth/dw_auth_verification_type.dart';
export 'src/protocol/dw_app_notification.dart';
export 'src/protocol/dw_updates_transport.dart';
export 'src/protocol/media/dw_media.dart';
export 'src/protocol/media/dw_media_type.dart';

class DwCoreServerpodClient {
  static late final SerializationManager protocol;
}
