import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:meu_estoque/domain/enums/services_enum.dart';
import 'package:meu_estoque/ui/core/widgets/app_bar/custom_sliver_app_bar.dart';
import 'package:meu_estoque/ui/home/viewmodel/home_controller.dart';
import 'package:meu_estoque/ui/home/viewmodel/home_states.dart';
import 'package:meu_estoque/ui/home/widgets/company_service_card.dart';
import 'package:meu_estoque/ui/home/widgets/drawer/home_drawer.dart';
import 'package:meu_estoque/ui/home/widgets/home_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  HomeController get _controller => Get.find<HomeController>();

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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Opções',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                          for (final service in ServicesEnum.values)
                            CompanyServiceCard(
                              service: service,
                              onTap: (service) {
                                if (_controller.state is HomeLoadingCompaniesState) {
                                  return;
                                }
                                Get.toNamed(
                                  service.route,
                                );
                              },
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
