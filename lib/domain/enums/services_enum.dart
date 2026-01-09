import 'package:meu_estoque/routing/routes.dart';

enum ServicesEnum {
  companies('Meus Produtos', Routes.productList),
  ;

  const ServicesEnum(this.label, this.route);

  final String label;
  final String route;
}
