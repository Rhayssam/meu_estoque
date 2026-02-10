import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:meu_estoque/ui/core/widgets/double_click_to_exit/double_click_to_exit.dart';
import 'package:meu_estoque/ui/home/viewmodel/home_controller.dart';
import 'package:meu_estoque/ui/home/widgets/drawer/home_drawer.dart';
import 'package:meu_estoque/ui/home_dashboard/home_dashboard_page.dart';
import 'package:meu_estoque/ui/profile/profile_page.dart';
import 'package:meu_estoque/ui/relatory/relatory_page.dart';
import 'package:meu_estoque/ui/store/store_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  HomeController get _controller => Get.find<HomeController>();

  final List<Widget> _pages = const [
    HomeDashboardPage(),
    StorePage(),
    RelatoryPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: DoubleClickToExit(
        child: Obx(
          () => Scaffold(
            backgroundColor: theme.colorScheme.primaryContainer,
            endDrawer: HomeDrawer(),
            body: SafeArea(
              child: IndexedStack(
                index: _controller.currentIndex.value,
                children: _pages,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _controller.currentIndex.value,
              onTap: _controller.changeTab,
              backgroundColor: theme.colorScheme.primary,
              selectedItemColor: theme.colorScheme.onPrimary,
              unselectedItemColor: theme.colorScheme.onPrimary.withAlpha(60),
              iconSize: 30,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.store_rounded), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.bar_chart_rounded), label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: ''),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
