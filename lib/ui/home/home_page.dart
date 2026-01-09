import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meu_estoque/ui/core/widgets/app_bar/custom_sliver_app_bar.dart';
import 'package:meu_estoque/ui/home/widgets/drawer/home_drawer.dart';
import 'package:meu_estoque/ui/home/widgets/home_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: SafeArea(
        child: Scaffold(
          drawer: HomeDrawer(),
          body: CustomScrollView(
            scrollDirection: Axis.vertical,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              CustomSliverAppBar.tertiaryFixed(
                title: const Text('MeuEstoque App'),
                leading: Builder(
                  builder: (context) {
                    return IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    HomeHeader(),
                  ],
                ),
              ),
              SliverPadding(
                padding: EdgeInsetsGeometry.all(20),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Opções',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
