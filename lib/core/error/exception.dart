class ServerException implements Exception {
  ServerException({this.message});
  final String message;
}

class EnumException implements Exception {
  EnumException({this.message});
  final String message;
}

class ConnectionException implements Exception {}
