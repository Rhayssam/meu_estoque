import 'package:meu_estoque/data/repositories/auth/auth_event.dart';
import 'package:meu_estoque/domain/user_model.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class AuthRepository {
  AsyncResult<UserModel> login({
    required String email,
    required String password,
  });

  AsyncResult<void> sessionExpired();

  AsyncResult<bool> isAuthenticated();

  Stream<AuthEvent> get authEvents;

  Future<void> dispose();
}
