import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_estoque/config/constants/app_constants.dart';
import 'package:meu_estoque/data/exceptions/auth_exception.dart';
import 'package:meu_estoque/data/exceptions/storage_exception.dart';
import 'package:meu_estoque/data/repositories/auth/auth_repository.dart';
import 'package:meu_estoque/data/services/local_storage/session/user_session_storage.dart';
import 'package:meu_estoque/data/services/logger/logger.dart';
import 'package:meu_estoque/domain/models/user_model.dart';
import 'package:meu_estoque/routing/routes.dart';
import 'package:meu_estoque/ui/auth/login/viewmodel/login_states.dart';
import 'package:meu_estoque/ui/core/services/dialog_manager.dart';
import 'package:meu_estoque/ui/core/services/loading_overlay_manager.dart';

class LoginController extends GetxController {
  LoginController({
    required AuthRepository authRepository,
    required UserSessionStorage userSessionStorage,
    required Logger log,
  }) : _authRepository = authRepository,
       _userSessionStorage = userSessionStorage,
       _log = log;

  final AuthRepository _authRepository;
  final UserSessionStorage _userSessionStorage;
  final Logger _log;

  final TextEditingController emailEC = TextEditingController();
  final TextEditingController passwordEC = TextEditingController();

  final Rx<LoginStates> _state = LoginStates.init.obs;
  final StreamController<LoginStates> _stateController = StreamController();

  final Rx<bool> _viewPassword = RxBool(true);
  final Rx<bool> _keepSigned = RxBool(false);

  bool get keepSigned => _keepSigned.value;

  final GlobalKey<FormState> formState = GlobalKey<FormState>();

  bool get viewPassword => _viewPassword.value;
  LoginStates get state => _state.value;

  @override
  void onInit() {
    super.onInit();
    _state.bindStream(_stateController.stream);
    _debugFillForms();
  }

  void _debugFillForms() {
    if (kDebugMode && AppConstants.kFillLoginForms) {
      emailEC.text = AppConstants.kLoginEmail;
      passwordEC.text = AppConstants.kLoginPassword;
    }
  }

  void changePasswordVisibility() {
    _viewPassword.value = !_viewPassword.value;
  }

  void setKeepSigned(bool? value) {
    _keepSigned.value = value ?? false;
  }

  bool _validateLogin() {
    return formState.currentState?.validate() ?? false;
  }

  void _handleFailure(Exception failure) {
    _log.error('Failed to login', error: failure);

    _stateController.add(LoginStates.error);

    late final String content;

    if (failure is AuthException) {
      content = failure.extraMessages?.join('\n') ?? failure.message;
    } else if (failure is StorageException) {
      content = 'Houve um erro inesperado';
    }

    DialogManager.of(Get.context!).showErrorDialog(
      title: 'Erro',
      content: content,
      buttonLabel: 'OK',
      onPressed: () {
        Get.back();
      },
    );
  }

  Future<void> _handleSuccess(UserModel user) async {
    _userSessionStorage.saveUser(user);
    _stateController.add(LoginStates.success);
  }

  Future<void> login() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!_validateLogin()) return;

    LoadingOverlayManager.instance.showLoading();
    _stateController.add(LoginStates.loading);

    final result = await _authRepository.login(
      email: emailEC.text,
      password: passwordEC.text,
    );

    LoadingOverlayManager.instance.hideLoading();
    result.fold<void>(_handleSuccess, _handleFailure);
  }

  Future<void> goToRegisterPage() async {
    await Get.toNamed(Routes.register);
  }

  @override
  void onClose() async {
    super.onClose();
    emailEC.dispose();
    passwordEC.dispose();
    await _stateController.close();
  }
}
