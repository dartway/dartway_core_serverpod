class DwS3StorageConfig {
  final String accessKey;
  final String secretKey;
  final String bucket;
  final String region;
  final String endpoint;
  final String publicHost;
  final String publicUrl;

  DwS3StorageConfig({
    required this.accessKey,
    required this.secretKey,
    required this.bucket,
    required this.region,
    required this.endpoint,
    required this.publicHost,
    required this.publicUrl,
  });
}
