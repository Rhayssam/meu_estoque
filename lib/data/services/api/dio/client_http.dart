import 'package:meu_estoque/data/services/api/dio/client_response.dart';
import 'package:meu_estoque/data/services/api/dio/response_format.dart';

abstract interface class ClientHttp {
  Future<ClientResponse<T>> get<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ResponseFormat responseFormat = ResponseFormat.json,
    bool authRequired = true,
  });
  Future<ClientResponse<T>> post<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ResponseFormat responseFormat = ResponseFormat.json,
    bool authRequired = true,
  });
  Future<ClientResponse<T>> delete<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ResponseFormat responseFormat = ResponseFormat.json,
    bool authRequired = true,
  });
  Future<ClientResponse<T>> put<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ResponseFormat responseFormat = ResponseFormat.json,
    bool authRequired = true,
  });

  Future<ClientResponse<T>> patch<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ResponseFormat responseFormat = ResponseFormat.json,
    bool authRequired = true,
  });
}
