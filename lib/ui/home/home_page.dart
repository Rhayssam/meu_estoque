import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meu_estoque/ui/core/widgets/app_bar/custom_app_bar.dart';
import 'package:meu_estoque/ui/home/widgets/home_drawer.dart';

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
          appBar: CustomAppBar.primary(
            title: const Text('HomePage'),
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
          body: Column(
            children: [Text('data')],
          ),
        ),
      ),
    );
  }
}
