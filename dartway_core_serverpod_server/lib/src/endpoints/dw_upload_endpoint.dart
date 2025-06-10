import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:serverpod/serverpod.dart';

class DwUploadEndpoint extends Endpoint {
  Future<String?> getUploadDescription(
    Session session, {
    required String path,
  }) async {
    return await session.storage.createDirectFileUploadDescription(
      storageId: 'public',
      path: path,
    );
  }

  Future<DwMedia?> verifyUpload(
    Session session, {
    required String path,
  }) async {
    if (await session.storage.verifyDirectFileUpload(
      storageId: 'public',
      path: path,
    )) {
      final uri = await session.storage.getPublicUrl(
        storageId: 'public',
        path: path,
      );

      print(
        uri.toString(),
      );
      if (uri == null) return null;

      return await session.db.insertRow(
        DwMedia(
          createdAt: DateTime.now(),
          publicUrl: uri.toString(),
          type: DwMediaType.image, //TODO: Change this to the correct type
        ),
      );
    }

    return null;
  }
}
