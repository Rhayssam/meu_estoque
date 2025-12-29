import 'package:meu_estoque/config/env/env_type.dart';

class Enviroment {
  const Enviroment._();

  static final EnvType env = EnvType.fromString('ENV');
  static const String apiUrl = String.fromEnvironment('API_URL');
}
