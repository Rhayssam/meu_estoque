import 'package:meu_estoque/routing/routes.dart';

enum ServicesEnum {
  products('Meus Produtos', Routes.productList),
  sales('Vendas', Routes.sales),
  inventory('Estoque', Routes.sales),
  ;

  const ServicesEnum(this.label, this.route);

  final String label;
  final String route;
}
