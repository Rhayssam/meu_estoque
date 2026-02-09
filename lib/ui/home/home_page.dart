import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:meu_estoque/ui/core/widgets/double_click_to_exit/double_click_to_exit.dart';
import 'package:meu_estoque/ui/home/viewmodel/home_controller.dart';
import 'package:meu_estoque/ui/home/widgets/drawer/home_drawer.dart';
import 'package:meu_estoque/ui/home/widgets/home_content.dart';
import 'package:meu_estoque/ui/home/widgets/home_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  HomeController get _controller => Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: DoubleClickToExit(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: theme.colorScheme.primary,
            selectedItemColor: theme.colorScheme.onPrimary,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.store), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
            ],
          ),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          endDrawer: HomeDrawer(),
          body: SafeArea(
            child: CustomScrollView(
              scrollDirection: Axis.vertical,
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: HomeHeader(theme: theme, controller: _controller),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: HomeContent(theme: theme),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
