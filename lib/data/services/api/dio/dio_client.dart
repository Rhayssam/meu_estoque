import 'package:dio/dio.dart';
import 'package:meu_estoque/data/exceptions/client_exception.dart';
import 'package:meu_estoque/data/services/api/dio/client_http.dart';
import 'package:meu_estoque/data/services/api/dio/client_response.dart';
import 'package:meu_estoque/data/services/api/dio/dio_config.dart';
import 'package:meu_estoque/data/services/api/dio/response_format.dart';

class DioClient implements ClientHttp {
  DioClient({
    required DioConfig dioConfig,
  }) : _dio = dioConfig.dio;

  final Dio _dio;

  Options _buildOptions({
    required Map<String, dynamic>? headers,
    required Map<String, dynamic>? extra,
    required ResponseType? responseType,
    bool authRequired = true,
  }) {
    extra = {
      ...?extra,
      'Auth-Required': authRequired,
    };

    return Options(
      headers: headers,
      extra: extra,
      responseType: responseType ?? ResponseType.json,
    );
  }

  ClientResponse<T> _mapResponse<T>(Response<T>? response) {
    return ClientResponse(
      data: response?.data,
      statusCode: response?.statusCode,
      statusMessage: response?.statusMessage,
    );
  }

  ResponseType _mapResponseFormat(ResponseFormat format) {
    return switch (format) {
      ResponseFormat.plainText => ResponseType.plain,
      ResponseFormat.json => ResponseType.json,
      ResponseFormat.bytes => ResponseType.bytes,
    };
  }

  Never _throwClientException(DioException e) {
    throw ClientException(
      statusCode: e.response?.statusCode,
      message: e.message ?? 'Unexpected error',
      error: e.error,
      response: _mapResponse(e.response),
    );
  }

  @override
  Future<ClientResponse<T>> get<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ResponseFormat responseFormat = ResponseFormat.json,
    bool authRequired = true,
  }) async {
    try {
      final options = _buildOptions(
        headers: headers,
        extra: extra,
        responseType: _mapResponseFormat(responseFormat),
        authRequired: authRequired,
      );
      final response = await _dio.get<T>(
        url,
        options: options,
        queryParameters: queryParameters,
      );

      return _mapResponse<T>(response);
    } on DioException catch (e) {
      _throwClientException(e);
    }
  }

  @override
  Future<ClientResponse<T>> post<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ResponseFormat responseFormat = ResponseFormat.json,
    bool authRequired = true,
  }) async {
    try {
      final options = _buildOptions(
        headers: headers,
        extra: extra,
        responseType: _mapResponseFormat(responseFormat),
        authRequired: authRequired,
      );
      final response = await _dio.post<T>(
        url,
        data: data,
        options: options,
        queryParameters: queryParameters,
      );
      return _mapResponse<T>(response);
    } on DioException catch (e) {
      _throwClientException(e);
    }
  }

  @override
  Future<ClientResponse<T>> put<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ResponseFormat responseFormat = ResponseFormat.json,
    bool authRequired = true,
  }) async {
    try {
      final options = _buildOptions(
        headers: headers,
        extra: extra,
        responseType: _mapResponseFormat(responseFormat),
        authRequired: authRequired,
      );
      final response = await _dio.put<T>(
        url,
        data: data,
        options: options,
        queryParameters: queryParameters,
      );
      return _mapResponse<T>(response);
    } on DioException catch (e) {
      _throwClientException(e);
    }
  }

  @override
  Future<ClientResponse<T>> delete<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ResponseFormat responseFormat = ResponseFormat.json,
    bool authRequired = true,
  }) async {
    try {
      final options = _buildOptions(
        headers: headers,
        extra: extra,
        responseType: _mapResponseFormat(responseFormat),
        authRequired: authRequired,
      );
      final response = await _dio.delete<T>(
        url,
        data: data,
        options: options,
        queryParameters: queryParameters,
      );
      return _mapResponse<T>(response);
    } on DioException catch (e) {
      _throwClientException(e);
    }
  }

  @override
  Future<ClientResponse<T>> patch<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ResponseFormat responseFormat = ResponseFormat.json,
    bool authRequired = true,
  }) async {
    try {
      final options = _buildOptions(
        headers: headers,
        extra: extra,
        responseType: _mapResponseFormat(responseFormat),
        authRequired: authRequired,
      );
      final response = await _dio.patch<T>(
        url,
        data: data,
        options: options,
        queryParameters: queryParameters,
      );
      return _mapResponse<T>(response);
    } on DioException catch (e) {
      _throwClientException(e);
    }
  }
}
