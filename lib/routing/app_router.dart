import 'package:get/get.dart';
import 'package:meu_estoque/routing/routes.dart';
import 'package:meu_estoque/ui/auth/login/login_bindings.dart';
import 'package:meu_estoque/ui/auth/login/login_page.dart';
import 'package:meu_estoque/ui/dev/dev_page.dart';

final class AppRouter {
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.dev,
      page: () => DevPage(),
    ),
    GetPage(
      name: Routes.login,
      binding: LoginBindings(),
      page: () => LoginPage(),
    ),
  ];
  static final GetPage unknownRoutePage = GetPage(
    name: Routes.notFound,
    page: () => LoginPage(),
  );
}
