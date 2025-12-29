import 'package:meu_estoque/domain/user_model.dart';
import 'package:result_dart/result_dart.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  AsyncResult<UserModel> login({required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
