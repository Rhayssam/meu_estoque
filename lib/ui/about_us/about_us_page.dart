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
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar.primary(
            leading: AppBarBackButton(onPressed: Get.back),
          ),
          SliverPadding(
            padding: EdgeInsetsGeometry.all(20),
            sliver: SliverToBoxAdapter(
              child: Column(
                spacing: 20,
                children: [
                  AboutCard(
                    title: 'Sobre o App',
                    contents: [
                      'Este aplicativo foi criado para simplificar o controle de vendas, estoque e produtos de forma prática e eficiente.',
                      'A ideia é transformar organização em estratégia e dados em decisões inteligentes.',
                      'Cada funcionalidade foi pensada para ajudar pequenos vendedores a:',
                      '- Controlar produtos com clareza',
                      '- Acompanhar vendas em tempo real',
                      '- Monitorar estoque sem surpresas',
                      '- Entender lucro de forma simples',
                      'Mais do que um gerenciador, este app é uma ferramenta para quem quer levar seu negócio a sério — mesmo começando pequeno.',
                      'Nosso objetivo é evoluir constantemente, trazendo melhorias que tornem a gestão cada vez mais intuitiva, segura e eficiente.',
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
