class ServerException implements Exception {
  final String? message;

  const ServerException({this.message});
}

class NetworkException implements Exception {}

class CacheException implements Exception {}
