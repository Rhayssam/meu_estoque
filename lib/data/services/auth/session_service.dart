import 'dart:async';

import 'package:get/get.dart';
import 'package:meu_estoque/data/repositories/auth/auth_event.dart';
import 'package:meu_estoque/data/repositories/auth/auth_repository.dart';
import 'package:meu_estoque/domain/user_model.dart';
import 'package:meu_estoque/routing/routes.dart';
import 'package:meu_estoque/ui/core/services/dialog_manager.dart';

final class SessionService extends GetxService {
  SessionService({
    required AuthRepository authRepository,
  }) : _authEvents = authRepository.authEvents {
    _authEventsSubscription = _authEvents.listen(_eventListener);
  }

  final Stream<AuthEvent> _authEvents;
  late final StreamSubscription<AuthEvent> _authEventsSubscription;
  bool _isSessionBeingHandled = false;

  bool get isSessionBeingHandled => _isSessionBeingHandled;

  void _eventListener(AuthEvent event) async {
    _isSessionBeingHandled = true;

    if (event is AuthLoginEvent) {
      final user = event.user;

      Get.offAllNamed(Routes.home, arguments: event.user);
    } else if (event is AuthSessionExpiredEvent) {
      await _handleSessionExpired();
    }

    _isSessionBeingHandled = false;
  }

  Future<void> _handleSessionExpired() async {
    if (Get.context != null) {
      await DialogManager.of(Get.context!).showInfoDialog(
        title: 'Sessão expirada',
        content: 'Você será redirecionado para a tela de login.',
        buttonLabel: 'OK',
        onPressed: Get.back,
      );
    }
    Get.offAllNamed(Routes.login);
  }

  @override
  void onClose() async {
    await _authEventsSubscription.cancel();
    super.onClose();
  }
}
