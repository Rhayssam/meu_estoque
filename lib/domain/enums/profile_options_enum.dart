import 'package:meu_estoque/routing/routes.dart';

enum ProfileOptionsEnum {
  myProfile('Meu Perfil', Routes.profileInfo),
  relatory('Minha Loja', Routes.store),
  settings('Preferências', Routes.settings),
  help('Ajuda', Routes.help),
  ;

  const ProfileOptionsEnum(this.label, this.route);

  final String label;
  final String route;
}
