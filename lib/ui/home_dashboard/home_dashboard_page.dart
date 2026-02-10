import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_estoque/ui/home/viewmodel/home_controller.dart';
import 'package:meu_estoque/ui/home/widgets/home_content.dart';
import 'package:meu_estoque/ui/home/widgets/home_header.dart';

class HomeDashboardPage extends StatelessWidget {
  const HomeDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = Get.find<HomeController>();

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: HomeHeader(theme: theme, controller: controller),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: HomeContent(theme: theme),
        ),
      ],
    );
  }
}
