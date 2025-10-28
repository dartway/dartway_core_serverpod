import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:mime/mime.dart';
import 'package:minio/minio.dart';
import 'package:minio/models.dart';

class DwCloudStorage {
  final Minio _client;
  final String bucket;
  final DwCloudStorageConfig config;

  DwCloudStorage._(this._client, this.bucket, this.config);

  static DwCloudStorage init({required DwCloudStorageConfig config}) {
    final client = Minio(
      endPoint: config.endPoint,
      // port: config.port,
      useSSL: true,
      accessKey: config.accessKey,
      secretKey: config.secretKey,
    );

    return DwCloudStorage._(client, config.bucket, config);
  }

  Future<bool> bucketExists() async {
    return await _client.bucketExists(bucket);
  }

  Future<Uri> createPresignedUploadUrl({
    required String objectPath,
    Duration expiry = const Duration(minutes: 10),
  }) async {
    final url = await _client.presignedPutObject(
      bucket,
      objectPath,
      expires: expiry.inSeconds,
    );
    return Uri.parse(url);
  }

  Future<StatObjectResult> statObject(String objectPath) async {
    try {
      return await _client.statObject(bucket, objectPath);
    } catch (e) {
      throw Exception('Failed to stat object: $e');
    }
  }

  String _getPublicUrl(String objectPath) {
    return Uri(
            scheme: 'https', host: config.endPoint, path: '$bucket/$objectPath')
        .toString();
  }

  DwCloudFile createCloudFile({
    required int? userId,
    required String objectPath,
    required int size,
  }) {
    return DwCloudFile(
      createdBy: userId,
      createdAt: DateTime.now(),
      publicUrl: _getPublicUrl(objectPath),
      mimeType: lookupMimeType(objectPath),
      size: size,
      bucket: bucket,
      path: objectPath,
    );
  }
}
