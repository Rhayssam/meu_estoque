import 'package:get/get.dart';
import 'package:meu_estoque/config/env/env_type.dart';
import 'package:meu_estoque/config/env/environment.dart';
import 'package:meu_estoque/data/repositories/auth/auth_repository.dart';
import 'package:meu_estoque/data/repositories/auth/auth_repository_impl.dart';
import 'package:meu_estoque/data/repositories/auth/auth_repository_mock.dart';
import 'package:meu_estoque/data/services/api/dio/client_http.dart';
import 'package:meu_estoque/data/services/api/dio/dio_base_config.dart';
import 'package:meu_estoque/data/services/api/dio/dio_client.dart';
import 'package:meu_estoque/data/services/auth/session_service.dart';
import 'package:meu_estoque/data/services/local_storage/secure_storage/secure_local_storage.dart';
import 'package:meu_estoque/data/services/local_storage/secure_storage/secure_local_storage_impl.dart';
import 'package:meu_estoque/data/services/local_storage/session/user_session_storage.dart';
import 'package:meu_estoque/data/services/local_storage/shared_preferences/shared_preferences_local_storage.dart';
import 'package:meu_estoque/data/services/local_storage/shared_preferences/shared_preferences_local_storage_impl.dart';
import 'package:meu_estoque/data/services/local_storage/token_storage/token_storage.dart';
import 'package:meu_estoque/data/services/local_storage/token_storage/token_storage_impl.dart';
import 'package:meu_estoque/data/services/logger/logger.dart';
import 'package:meu_estoque/ui/core/theme/theme_controller.dart';

class Dependencies {
  Future<void> initialize() async {
    Get.put<Logger>(Logger(), permanent: true);

    // Storages
    Get.put<SecureLocalStorage>(
      SecureLocalStorageImpl(),
      permanent: true,
    );

    Get.put<SecureLocalStorage>(SecureLocalStorageImpl(), permanent: true);

    await Get.putAsync<SharedPreferencesLocalStorage>(
      () async => await SharedPreferencesLocalStorageImpl.init(),
      permanent: true,
    );

    Get.put<UserSessionStorage>(
      UserSessionStorage(Get.find<SharedPreferencesLocalStorage>()),
      permanent: true,
    );

    Get.put<ThemeController>(
      ThemeController(Get.find<UserSessionStorage>()),
      permanent: true,
    );

    Get.put<TokenStorage>(
      TokenStorageImpl(
        storage: Get.find<SecureLocalStorage>(),
        log: Get.find<Logger>(),
      ),
      permanent: true,
    );

    final dioConfig = DioBaseConfig(
      log: Get.find<Logger>(),
      tokenStorage: Get.find<TokenStorage>(),
      authRepository: () => Get.find<AuthRepository>(),
    );

    Get.put<ClientHttp>(
      DioClient(dioConfig: dioConfig),
      permanent: true,
    );

    Get.put<AuthRepository>(
      Environment.env == EnvType.local
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
      permanent: true,
    );

    Get.put<SessionService>(
      SessionService(authRepository: Get.find<AuthRepository>()),
      permanent: true,
    );
  }
}
