import 'package:dio/dio.dart';
import 'package:meu_estoque/data/exceptions/storage_exception.dart';
import 'package:meu_estoque/data/repositories/auth/auth_repository.dart';
import 'package:meu_estoque/data/services/local_storage/token_storage/token_storage.dart';
import 'package:meu_estoque/data/services/logger/logger.dart';

final class TokenInterceptor extends QueuedInterceptor {
  TokenInterceptor({
    required TokenStorage tokenStorage,
    required Logger log,
    required AuthRepository Function() authRepository,
  }) : _tokenStorage = tokenStorage,
       _log = log,
       _authRepository = authRepository;

  final AuthRepository Function() _authRepository;
  final TokenStorage _tokenStorage;
  final Logger _log;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.extra['Auth-Required'] != true) {
      handler.next(options);
      return;
    }

    final result = await _tokenStorage.get();

    result.fold(
      (success) {
        options.headers['Authorization'] = 'Bearer $success';
        _log.info('TokenInterceptor: Token added to Authorization header');
        handler.next(options);
      },
      (failure) {
        handler.reject(
          DioException(
            message: 'TokenInterceptor: Request reject because no token avaiable',
            type: DioExceptionType.cancel,
            requestOptions: options,
            error: failure,
          ),
        );
      },
    );
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      _log.info('TokenInterceptor: Token expired. Logout user');

      final result = await _authRepository().sessionExpired();

      result.onFailure((failure) {
        final storageException = failure as StorageException;
        _log.error('TokenInterceptor: Error on logout user', error: storageException);
      });

      handler.reject(
        DioException(
          message: 'TokenInterceptor: Token expired',
          type: DioExceptionType.cancel,
          requestOptions: err.requestOptions,
          error: err,
        ),
      );
      return;
    }
    handler.next(err);
  }
}
