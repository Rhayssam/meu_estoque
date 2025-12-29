import 'package:meu_estoque/config/constants/token_storage_impl.dart';
import 'package:meu_estoque/data/exceptions/storage_exception.dart';
import 'package:meu_estoque/data/services/local_storage/secure_storage/secure_local_storage.dart';
import 'package:meu_estoque/data/services/local_storage/token_storage/token_storage.dart';
import 'package:meu_estoque/data/services/logger/logger.dart';
import 'package:meu_estoque/utils/annotations/failures.dart';
import 'package:result_dart/result_dart.dart';

class TokenStorageImpl implements TokenStorage {
  TokenStorageImpl({
    required SecureLocalStorage storage,
    required Logger log,
  }) : _storage = storage,
       _log = log;

  final SecureLocalStorage _storage;
  final Logger _log;

  String? _cachedToken;

  @override
  @Failures([StorageException])
  AsyncResult<void> clear() async {
    try {
      await _storage.delete(StorageKeys.accessToken);
      _cachedToken = null;
      return Success(());
    } on StorageException catch (e, s) {
      _log.error('Failed to clear user token', error: e, stackTrace: s);
      return Failure(StorageException(message: 'Failed to delete access token'));
    }
  }

  @override
  @Failures([StorageException])
  AsyncResult<String> get() async {
    try {
      if (_cachedToken != null) {
        return Success(_cachedToken!);
      }

      final storedToken = await _storage.read(StorageKeys.accessToken);
      if (storedToken == null || storedToken.isEmpty) {
        return Failure(StorageException(message: 'token is empty or null'));
      }

      _cachedToken = storedToken;
      return Success(_cachedToken ?? '');
    } on StorageException catch (e) {
      _log.error('Failed to get user token', error: e);
      return Failure(StorageException(message: 'Failed to get access token'));
    }
  }

  @override
  @Failures([StorageException])
  AsyncResult<void> store(String token) async {
    try {
      if (token.isEmpty) {
        return Failure(StorageException(message: 'Invalid token'));
      }

      await _storage.write(StorageKeys.accessToken, token);
      return Success(());
    } on StorageException catch (e) {
      _log.error('Failed to store user token', error: e);
      return Failure(StorageException(message: 'Failed to store access token'));
    }
  }
}
