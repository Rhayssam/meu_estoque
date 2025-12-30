import 'package:dio/dio.dart';
import 'package:meu_estoque/config/env/environment.dart';
import 'package:meu_estoque/data/repositories/auth/auth_repository.dart';
import 'package:meu_estoque/data/services/api/dio/dio_config.dart';
import 'package:meu_estoque/data/services/api/dio/logging_interceptor.dart';
import 'package:meu_estoque/data/services/api/dio/token_interceptor.dart';
import 'package:meu_estoque/data/services/local_storage/token_storage/token_storage.dart';
import 'package:meu_estoque/data/services/logger/logger.dart';

final class DioBaseConfig extends DioConfig {
  DioBaseConfig({
    required Logger log,
    required TokenStorage tokenStorage,
    required AuthRepository Function() authRepository,
  }) : _log = log,
       _tokenStorage = tokenStorage,
       _authRepository = authRepository;

  final Logger _log;
  final TokenStorage _tokenStorage;
  final AuthRepository Function() _authRepository;

  Map<String, dynamic> get defaultHeaders => {
    'Accept': 'application/json',
  };

  @override
  Dio get dio {
    final dio = Dio(
      BaseOptions(
        baseUrl: Environment.apiUrl,
        responseType: ResponseType.json,
        headers: defaultHeaders,
        receiveTimeout: const Duration(seconds: 60),
        connectTimeout: const Duration(seconds: 60),
      ),
    );

    dio.interceptors.addAll([
      TokenInterceptor(
        tokenStorage: _tokenStorage,
        log: _log,
        authRepository: _authRepository,
      ),
      LoggingInterceptor(log: _log),
    ]);

    return dio;
  }
}
