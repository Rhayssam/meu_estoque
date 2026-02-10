import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:get/get.dart';
import 'package:meu_estoque/ui/core/widgets/double_click_to_exit/double_click_to_exit.dart';
import 'package:meu_estoque/ui/home/viewmodel/home_controller.dart';
import 'package:meu_estoque/ui/home/widgets/drawer/home_drawer.dart';
import 'package:meu_estoque/ui/home_dashboard/home_dashboard_page.dart';
import 'package:meu_estoque/ui/profile/profile_page.dart';
import 'package:meu_estoque/ui/relatory/relatory_page.dart';
// import 'package:meu_estoque/ui/store/store_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  HomeController get _controller => Get.find<HomeController>();

  final List<Widget> _pages = const [
    HomeDashboardPage(),
    // StorePage(),
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
            body: BottomBar(
              fit: StackFit.expand,
              icon: (width, height) => Center(
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: null,
                  icon: Icon(
                    Icons.arrow_upward,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ),
              borderRadius: BorderRadius.circular(500),
              curve: Curves.decelerate,
              showIcon: true,
              start: 2,
              end: 0,
              iconHeight: 35,
              iconWidth: 35,
              barAlignment: Alignment.bottomCenter,
              offset: 10,
              reverse: false,
              hideOnScroll: true,
              scrollOpposite: false,
              barColor: theme.colorScheme.primary,
              respectSafeArea: true,
              body: (context, controller) => SafeArea(
                child: IndexedStack(
                  index: _controller.currentIndex.value,
                  children: _pages,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildIconButton(Icons.home_rounded, 0, _controller, theme),
                  _buildIconButton(Icons.bar_chart_rounded, 1, _controller, theme),
                  _buildIconButton(Icons.person_rounded, 2, _controller, theme),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildIconButton(IconData icon, int index, HomeController controller, ThemeData theme) {
  return IconButton(
    onPressed: () => controller.currentIndex.value = index,
    icon: Icon(
      icon,
      color: controller.currentIndex.value == index
          ? theme.colorScheme.onPrimary
          : theme.colorScheme.onPrimary.withAlpha(60),
    ),
  );
}
