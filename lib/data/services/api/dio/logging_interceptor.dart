import 'package:dio/dio.dart';
import 'package:meu_estoque/data/services/logger/logger.dart';

final class LoggingInterceptor extends Interceptor {
  LoggingInterceptor({
    required Logger log,
  }) : _log = log;

  final Logger _log;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _log.error(
      'ERROR: REQUEST[${err.requestOptions.method}] ${DateTime.now()} - [${err.response?.statusCode}] ${err.requestOptions.path}',
      error: err,
      stackTrace: err.stackTrace,
      time: DateTime.now(),
    );
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _log.info('''
REQUEST[${options.method}] => PATH: ${options.path}
Headers: ${options.headers}
QueryParameters: ${options.queryParameters}
Data: ${options.data}''');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _log.info('''
RESPONSE[${response.requestOptions.method}] ${DateTime.now()} - [${response.statusCode}] ${response.requestOptions.path}
Data: ${response.data}
''');
    super.onResponse(response, handler);
  }
}
