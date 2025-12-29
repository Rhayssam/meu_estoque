class ClientResponse<T> {
  ClientResponse({
    required this.data,
    required this.statusCode,
    required this.statusMessage,
  });

  final T? data;
  final int? statusCode;
  final String? statusMessage;
}
