class BaseException implements Exception {
  final String cause;

  BaseException({this.cause = ''});
}
