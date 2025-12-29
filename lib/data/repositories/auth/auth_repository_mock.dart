// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:async';

import 'package:meu_estoque/data/exceptions/auth_exception.dart';
import 'package:meu_estoque/data/exceptions/client_exception.dart';
import 'package:meu_estoque/data/repositories/auth/auth_event.dart';
import 'package:meu_estoque/data/repositories/auth/auth_repository.dart';
import 'package:meu_estoque/data/services/api/dio/client_http.dart';
import 'package:meu_estoque/data/services/local_storage/token_storage/token_storage.dart';
import 'package:meu_estoque/data/services/logger/logger.dart';
import 'package:meu_estoque/domain/user_model.dart';
import 'package:result_dart/result_dart.dart';

class AuthRepositoryMock implements AuthRepository {
  AuthRepositoryMock({
    required ClientHttp client,
    required Logger log,
    required TokenStorage tokenStorage,
  }) : _client = client,
       _log = log,
       _tokenStorage = tokenStorage;

  final ClientHttp _client;
  final Logger _log;
  final TokenStorage _tokenStorage;

  final StreamController<AuthEvent> _authEvents = StreamController<AuthEvent>.broadcast();

  @override
  AsyncResult<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.get<List<dynamic>>(
        '/login',
        authRequired: false,
      );

      final dataList = response.data;

      if (dataList == null || dataList.isEmpty) {
        return Failure(AuthException(message: 'Resposta inválida do servidor mock'));
      }

      final userMap = dataList.first as Map<String, dynamic>;

      final user = UserModel.fromMap(userMap);

      final token = userMap['token'] as String?;
      if (token != null) {
        await _tokenStorage.store(token);
      }

      _log.info('Login mock efetuado com sucesso: ${user.toString()}');
      _authEvents.add(AuthLoginEvent(user));

      return Success(user);
    } on ClientException catch (e) {
      _log.error('Erro no login mock', error: e);

      String message = 'Erro ao comunicar com o servidor mock';
      if (e.response?.data != null) {
        message = e.response?.data?['message'] ?? message;
      }

      return Failure(
        AuthException(
          message: message,
          statusCode: e.statusCode,
        ),
      );
    } catch (e) {
      _log.error('Erro inesperado no login mock', error: e);
      return Failure(
        AuthException(message: 'Erro interno inesperado no mock'),
      );
    }
  }
}
