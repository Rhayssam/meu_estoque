import 'package:meu_estoque/routing/routes.dart';

enum ServicesEnum {
  companies('Minhas Empresas', Routes.companyList),
  ;

  const ServicesEnum(this.label, this.route);

  final String label;
  final String route;
}
