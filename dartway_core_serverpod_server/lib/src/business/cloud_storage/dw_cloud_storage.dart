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

  // Метод для определения MIME-type по расширению
  String _getMimeType(String objectPath) {
    final pathLower = objectPath.toLowerCase();
    
    // Явно определяем типы для аудио и видео
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
    
    // Для остальных файлов используем mime пакет
    return lookupMimeType(objectPath) ?? 'application/octet-stream';
  }

  Future<Uri> createPresignedUploadUrl({
    required String objectPath,
    Duration expiry = const Duration(minutes: 10),
  }) async {
    final mimeType = _getMimeType(objectPath);
    
    final url = await _client.presignedPutObject(
      bucket,
      objectPath,
      expires: expiry.inSeconds,
      // Добавляем метаданные с правильным Content-Type
      extraHeaders: {
        'Content-Type': mimeType,
      },
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
      mimeType: _getMimeType(objectPath), // Используем новый метод
      size: size,
      bucket: bucket,
      path: objectPath,
    );
  }
}
