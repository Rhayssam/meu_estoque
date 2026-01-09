import 'package:get/get.dart';
import 'package:meu_estoque/routing/routes.dart';
import 'package:meu_estoque/ui/about_us/about_us_bindings.dart';
import 'package:meu_estoque/ui/about_us/about_us_page.dart';
import 'package:meu_estoque/ui/auth/login/login_bindings.dart';
import 'package:meu_estoque/ui/auth/login/login_page.dart';
import 'package:meu_estoque/ui/company_list/company_list_bindings.dart';
import 'package:meu_estoque/ui/company_list/company_list_page.dart';
import 'package:meu_estoque/ui/dev/dev_page.dart';
import 'package:meu_estoque/ui/home/home_bindings.dart';
import 'package:meu_estoque/ui/home/home_page.dart';

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
    GetPage(
      name: Routes.home,
      binding: HomeBindings(),
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.about,
      binding: AboutUsBindings(),
      page: () => AboutUsPage(),
    ),
    GetPage(
      name: Routes.companyList,
      binding: CompanyListBindings(),
      page: () => CompanyListPage(),
    ),
  ];
  static final GetPage unknownRoutePage = GetPage(
    name: Routes.notFound,
    page: () => LoginPage(),
  );
}
