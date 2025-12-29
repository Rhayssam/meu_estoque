import 'package:meu_estoque/domain/user_model.dart';

sealed class AuthEvent {
  const AuthEvent();
}

final class AuthLoginEvent extends AuthEvent {
  const AuthLoginEvent(this.user);

  final UserModel user;
}

final class AuthSignUpEvent extends AuthEvent {
  const AuthSignUpEvent(this.user);

  final UserModel user;
}

final class AuthLogoutEvent extends AuthEvent {
  const AuthLogoutEvent();
}

final class AuthSessionExpiredEvent extends AuthEvent {
  const AuthSessionExpiredEvent();
}
