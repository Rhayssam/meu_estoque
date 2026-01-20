import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_estoque/ui/about_us/widgets/about_card.dart';
import 'package:meu_estoque/ui/core/widgets/app_bar/app_bar_back_button.dart';
import 'package:meu_estoque/ui/core/widgets/app_bar/custom_sliver_app_bar.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            CustomSliverAppBar.surface(
              title: Text('Sobre Nós'),
              leading: AppBarBackButton(onPressed: Get.back),
            ),
            SliverPadding(
              padding: EdgeInsetsGeometry.all(20),
              sliver: SliverToBoxAdapter(
                child: Column(
                  spacing: 20,
                  children: [
                    AboutCard(
                      title: 'Título',
                      subtitle: 'Descrição Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    ),
                    AboutCard(
                      title: 'Título',
                      subtitle: 'Descrição Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    ),
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
