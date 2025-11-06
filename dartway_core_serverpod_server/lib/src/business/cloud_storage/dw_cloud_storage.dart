import 'package:dartway_core_serverpod_server/dartway_core_serverpod_server.dart';
import 'package:mime/mime.dart';
import 'package:minio/minio.dart';
import 'package:minio/models.dart';

class DwCloudStorage {
  late final Minio _client;
  final DwCloudStorageConfig config;

  DwCloudStorage({required this.config}) {
    _client = Minio(
      endPoint: config.endPoint,
      // port: config.port,
      useSSL: true,
      accessKey: config.accessKey,
      secretKey: config.secretKey,
    );
  }

  Future<bool> bucketExists() async {
    return await _client.bucketExists(config.bucket);
  }

  // Identify MIME-type by file extension
  String _getMimeType(String objectPath) {
    final pathLower = objectPath.toLowerCase();

    // Explicitly define types for audio and video
    if (pathLower.endsWith('.mp3') || pathLower.endsWith('.mpeg')) {
      return 'audio/mpeg';
    } else if (pathLower.endsWith('.m4a') || pathLower.endsWith('.aac')) {
      return 'audio/aac';
    } else if (pathLower.endsWith('.wav')) {
      return 'audio/wav';
    } else if (pathLower.endsWith('.mp4') || pathLower.endsWith('.m4v')) {
      return 'video/mp4';
    } else if (pathLower.endsWith('.webm')) {
      return 'video/webm';
    }

    // For other files, use mime package
    return lookupMimeType(objectPath) ?? 'application/octet-stream';
  }

  Future<Uri> createPresignedUploadUrl({
    required String objectPath,
    Duration expiry = const Duration(minutes: 10),
  }) async {
    final url = await _client.presignedPutObject(
      config.bucket,
      objectPath,
      expires: expiry.inSeconds,
    );
    return Uri.parse(url);
  }

  Future<StatObjectResult> statObject(String objectPath) async {
    try {
      return await _client.statObject(config.bucket, objectPath);
    } catch (e) {
      throw Exception('Failed to stat object: $e');
    }
  }

  String _getPublicUrl(String objectPath) {
    return Uri(
            scheme: 'https',
            host: config.endPoint,
            path: '${config.bucket}/$objectPath')
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
      bucket: config.bucket,
      path: objectPath,
    );
  }
}
