class LogoutException implements Exception {
  LogoutException(this.message);

  final String message;

  @override
  String toString() => 'LogoutException: $message';
}
