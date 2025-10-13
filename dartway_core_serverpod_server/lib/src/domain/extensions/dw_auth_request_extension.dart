import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';

extension DwAuthRequestExtension on DwAuthRequest {
  setInitialStatus() {
    if (password != null) {
      status = DwAuthRequestStatus.pending;
    } else {
      status = DwAuthRequestStatus.pending;
    }
  }
}
