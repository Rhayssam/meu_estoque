import 'dart:developer';
import 'package:get/get.dart';
import 'package:meu_estoque/config/env/env_type.dart';
import 'package:meu_estoque/config/env/environment.dart';
import 'package:meu_estoque/data/repositories/auth/auth_repository.dart';
import 'package:meu_estoque/data/repositories/auth/auth_repository_impl.dart';
import 'package:meu_estoque/data/repositories/auth/auth_repository_mock.dart';
import 'package:meu_estoque/data/services/api/dio/client_http.dart';
import 'package:meu_estoque/data/services/local_storage/session/user_session_storage.dart';
import 'package:meu_estoque/data/services/local_storage/token_storage/token_storage.dart';
import 'package:meu_estoque/data/services/logger/logger.dart';
import 'package:meu_estoque/ui/auth/login/viewmodel/login_controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    log(Environment.env.toString());
    Get.lazyPut<AuthRepository>(
      () => Environment.env == EnvType.local
          ? AuthRepositoryMock(
              client: Get.find<ClientHttp>(),
              log: Get.find<Logger>(),
              tokenStorage: Get.find<TokenStorage>(),
            )
          : AuthRepositoryImpl(
              client: Get.find<ClientHttp>(),
              log: Get.find<Logger>(),
              tokenStorage: Get.find<TokenStorage>(),
            ),
    );
    Get.put<LoginController>(
      LoginController(
        authRepository: Get.find<AuthRepository>(),
        log: Get.find<Logger>(),
        userSessionStorage: Get.find<UserSessionStorage>(),
      ),
    );
  }
}
