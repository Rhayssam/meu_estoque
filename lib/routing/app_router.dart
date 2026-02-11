import 'package:get/get.dart';
import 'package:meu_estoque/routing/routes.dart';
import 'package:meu_estoque/ui/about_us/about_us_bindings.dart';
import 'package:meu_estoque/ui/about_us/about_us_page.dart';
import 'package:meu_estoque/ui/auth/auth_option/auth_option_bindings.dart';
import 'package:meu_estoque/ui/auth/auth_option/auth_option_page.dart';
import 'package:meu_estoque/ui/auth/login/login_bindings.dart';
import 'package:meu_estoque/ui/auth/login/login_page.dart';
import 'package:meu_estoque/ui/auth/register/register_bindings.dart';
import 'package:meu_estoque/ui/auth/register/register_page.dart';
import 'package:meu_estoque/ui/help/help_bindings.dart';
import 'package:meu_estoque/ui/help/help_page.dart';
import 'package:meu_estoque/ui/home_dashboard/home_dashboard_bindings.dart';
import 'package:meu_estoque/ui/home_dashboard/home_dashboard_page.dart';
import 'package:meu_estoque/ui/inventory/inventory_bindings.dart';
import 'package:meu_estoque/ui/inventory/inventory_page.dart';
import 'package:meu_estoque/ui/product_add/product_add_bindings.dart';
import 'package:meu_estoque/ui/product_add/product_add_page.dart';
import 'package:meu_estoque/ui/product_list/product_list_bindings.dart';
import 'package:meu_estoque/ui/product_list/product_list_page.dart';
import 'package:meu_estoque/ui/dev/dev_page.dart';
import 'package:meu_estoque/ui/home/home_bindings.dart';
import 'package:meu_estoque/ui/home/home_page.dart';
import 'package:meu_estoque/ui/profile/profile_bindings.dart';
import 'package:meu_estoque/ui/profile/profile_page.dart';
import 'package:meu_estoque/ui/profile_info/profile_info_bindings.dart';
import 'package:meu_estoque/ui/profile_info/profile_info_page.dart';
import 'package:meu_estoque/ui/relatory/relatory_bindings.dart';
import 'package:meu_estoque/ui/relatory/relatory_page.dart';
import 'package:meu_estoque/ui/sales/sales_bindings.dart';
import 'package:meu_estoque/ui/sales/sales_page.dart';
import 'package:meu_estoque/ui/settings/settings_bindings.dart';
import 'package:meu_estoque/ui/settings/settings_page.dart';
import 'package:meu_estoque/ui/splash/splash_bindings.dart';
import 'package:meu_estoque/ui/splash/splash_page.dart';
import 'package:meu_estoque/ui/store/store_bindings.dart';
import 'package:meu_estoque/ui/store/store_page.dart';

final class AppRouter {
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.dev,
      page: () => DevPage(),
    ),
    GetPage(
      name: Routes.splash,
      binding: SplashBindings(),
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routes.authOptions,
      binding: AuthOptionBindings(),
      page: () => AuthOptionPage(),
    ),
    GetPage(
      name: Routes.login,
      binding: LoginBindings(),
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.register,
      binding: RegisterBindings(),
      page: () => RegisterPage(),
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
      name: Routes.productList,
      binding: ProductListBindings(),
      page: () => ProductListPage(),
    ),
    GetPage(
      name: Routes.productAdd,
      binding: ProductAddBindings(),
      page: () => ProductAddPage(),
    ),
    GetPage(
      name: Routes.sales,
      binding: SalesBindings(),
      page: () => SalesPage(),
    ),
    GetPage(
      name: Routes.inventory,
      binding: InventoryBindings(),
      page: () => InventoryPage(),
    ),
    GetPage(
      name: Routes.homeDashboard,
      binding: HomeDashboardBindings(),
      page: () => HomeDashboardPage(),
    ),
    GetPage(
      name: Routes.relatory,
      binding: RelatoryBindings(),
      page: () => RelatoryPage(),
    ),

    // Profile
    GetPage(
      name: Routes.profile,
      binding: ProfileBindings(),
      page: () => ProfilePage(),
    ),
    GetPage(
      name: Routes.profileInfo,
      binding: ProfileInfoBindings(),
      page: () => ProfileInfoPage(),
    ),
    GetPage(
      name: Routes.store,
      binding: StoreBindings(),
      page: () => StorePage(),
    ),
    GetPage(
      name: Routes.settings,
      binding: SettingsBindings(),
      page: () => SettingsPage(),
    ),
    GetPage(
      name: Routes.help,
      binding: HelpBindings(),
      page: () => HelpPage(),
    ),
  ];
  static final GetPage unknownRoutePage = GetPage(
    name: Routes.notFound,
    page: () => LoginPage(),
  );
}
