import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_estoque/ui/core/services/dialog_manager.dart';
import 'package:meu_estoque/ui/core/widgets/copyright/copyright.dart';
import 'package:meu_estoque/ui/home/viewmodel/home_controller.dart';
import 'package:meu_estoque/ui/home/widgets/drawer_option.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  HomeController get _homeController => Get.find<HomeController>();

  Future<bool?> _logoutConfirm(BuildContext context) {
    return DialogManager.of(context).showConfirmDialog<bool>(
      title: 'Sair',
      content: 'Você tem certeza que deseja sair?',
      confirmLabel: 'Sair',
      cancelLabel: 'Cancelar',
      onConfirm: () => Get.back<bool>(result: true),
      onCancel: () => Get.back<bool>(result: false),
    );
  }

  List<DrawerOption> _getDrawerOptions(BuildContext context) {
    final List<DrawerOption> drawerOptions = [
      DrawerOption(
        title: 'Meu Perfil',
        icon: Icons.person,
        onTap: () {},
      ),
      DrawerOption(
        title: 'Configurações',
        icon: Icons.settings,
        onTap: () {},
      ),
      DrawerOption(title: 'Sobre', icon: Icons.info, onTap: () {}),
    ];

    return drawerOptions;
  }

  @override
  Widget build(BuildContext context) {
    final drawerOptions = _getDrawerOptions(context);

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      width: double.infinity,
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.close,
                        color: Theme.of(context).colorScheme.onTertiaryFixed,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => drawerOptions[index],
                  childCount: drawerOptions.length,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Divider(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DrawerOption(
                  title: 'Sair',
                  icon: Icons.logout,
                  onTap: () async {
                    final bool hasConfirmed = await _logoutConfirm(context) ?? false;
                    if (hasConfirmed) {
                      () {};
                    }
                  },
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const Spacer(),
                    Center(
                      child: Copyright(),
                    ),
                    const SizedBox(height: 22),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
