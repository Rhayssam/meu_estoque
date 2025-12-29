class AuthException implements Exception {
  AuthException({
    required this.message,
    this.statusCode,
    this.extraMessages,
  });

  final String message;
  final int? statusCode;
  final List<String>? extraMessages;

  @override
  String toString() {
    return 'AuthException{message=$message, statusCode=$statusCode, extraMessages=$extraMessages}';
  }
}
