import 'package:meu_estoque/config/env/env_type.dart';

class Environment {
  const Environment._();

  static final EnvType env = EnvType.fromString(const String.fromEnvironment('ENV'));
  static const String apiUrl = String.fromEnvironment('API_URL');
}
