import 'package:meu_estoque/data/services/api/dio/client_response.dart';

final class ClientException {
  ClientException({
    required this.message,
    this.response,
    this.error,
    this.statusCode,
  });

  final int? statusCode;
  final String message;
  final Object? error;
  final ClientResponse? response;

  @override
  String toString() {
    return 'ClientException: $message (Status: $statusCode, Response: $response)';
  }
}
