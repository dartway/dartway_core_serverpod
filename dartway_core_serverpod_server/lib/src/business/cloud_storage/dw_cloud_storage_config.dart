class DwCloudStorageConfig {
  final String endPoint;
  final int port;
  final bool useSSL;
  final String accessKey;
  final String secretKey;
  final String bucket;

  DwCloudStorageConfig({
    required this.endPoint,
    required this.port,
    required this.useSSL,
    required this.accessKey,
    required this.secretKey,
    required this.bucket,
  });

  factory DwCloudStorageConfig.fromEnv(Map<String, String> env) {
    return DwCloudStorageConfig(
      endPoint: env['dwCloudStorageEndpoint']!,
      port: int.parse(env['dwCloudStoragePort'] ?? '443'),
      useSSL: env['dwCloudStorageUseSSL']?.toLowerCase() == 'true',
      accessKey: env['dwCloudStorageAccessKey']!,
      secretKey: env['dwCloudStorageSecretKey']!,
      bucket: env['dwCloudStorageBucket']!,
    );
  }
}
