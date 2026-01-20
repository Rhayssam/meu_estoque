import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:meu_estoque/ui/core/widgets/app_bar/custom_sliver_app_bar.dart';
import 'package:meu_estoque/ui/home/viewmodel/home_controller.dart';
import 'package:meu_estoque/ui/home/widgets/drawer/home_drawer.dart';
import 'package:meu_estoque/ui/home/widgets/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  HomeController get _controller => Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        drawer: HomeDrawer(),
        body: SafeArea(
          child: CustomScrollView(
            scrollDirection: Axis.vertical,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              CustomSliverAppBar.surface(
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
              // SliverToBoxAdapter(
              //   child: HomeHeader(),
              // ),
              SliverPadding(
                padding: EdgeInsetsGeometry.all(20),
                sliver: SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.all(Radius.circular(15)),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        spacing: 5,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'DASHBOARD',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Divider(
                            color: Theme.of(context).colorScheme.primaryFixed.withAlpha(70),
                          ),
                          Text('Vendas da semana: '),
                          Text('Vendas do mês: '),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                sliver: SliverToBoxAdapter(
                  child: Divider(
                    color: Theme.of(context).colorScheme.primaryFixed.withAlpha(70),
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                sliver: SliverToBoxAdapter(
                  child: Text('Data'),
                ),
              ),
              SliverPadding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                sliver: SliverToBoxAdapter(
                  child: Divider(
                    color: Theme.of(context).colorScheme.primaryFixed.withAlpha(70),
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsetsGeometry.all(20),
                sliver: SliverToBoxAdapter(
                  child: Services(controller: _controller),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
