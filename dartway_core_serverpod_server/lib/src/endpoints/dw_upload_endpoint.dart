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

  Future<DwCloudFile?> verifyUpload(
    Session session, {
    required String path,
  }) async {
    final info = await DwCore.instance.cloudStorage!.statObject(path);

    if (info.size == null || info.size! <= 0) return null;

    final file = await session.db.insertRow(
      DwCore.instance.cloudStorage!.createCloudFile(
        userId: await session.currentUserProfileId,
        objectPath: path,
        size: info.size!,
      ),
    );

    return file;
  }
}
