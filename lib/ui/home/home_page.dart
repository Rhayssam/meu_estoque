import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:meu_estoque/ui/core/widgets/double_click_to_exit/double_click_to_exit.dart';
import 'package:meu_estoque/ui/home/viewmodel/home_controller.dart';
import 'package:meu_estoque/ui/home/widgets/drawer/home_drawer.dart';
import 'package:meu_estoque/ui/home/widgets/services.dart';

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
                SliverFillRemaining(
                  child: Column(
                    spacing: 25,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          spacing: 25,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Olá, usuário!',
                                      style: theme.textTheme.headlineSmall?.copyWith(
                                        color: theme.colorScheme.onPrimaryContainer,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      _controller.todayFormatted,
                                      style: theme.textTheme.labelSmall?.copyWith(
                                        color: theme.colorScheme.onPrimaryContainer.withAlpha(200),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.secondaryContainer,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(alpha: 0.1),
                                        blurRadius: 5,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  padding: EdgeInsets.all(6),
                                  child: Builder(
                                    builder: (context) {
                                      return IconButton(
                                        onPressed: () {
                                          Scaffold.of(context).openEndDrawer();
                                        },
                                        icon: const Icon(Icons.notifications),
                                        color: theme.colorScheme.onSecondaryContainer,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SearchBar(
                              // hintText: 'Pesquisar produto . . .',
                              hintText: 'Pesquisar . . .',
                              backgroundColor: WidgetStatePropertyAll(theme.colorScheme.secondaryContainer),
                              onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
                              elevation: WidgetStatePropertyAll(1),
                              textStyle: WidgetStatePropertyAll(
                                theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.onPrimaryContainer),
                              ),
                              leading: Icon(
                                Icons.search,
                                color: theme.colorScheme.onPrimaryContainer,
                              ),
                              padding: WidgetStatePropertyAll(EdgeInsets.all(10)),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Serviços',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: theme.colorScheme.onPrimaryContainer,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Icon(
                                  Icons.edit,
                                  color: theme.colorScheme.onPrimaryContainer,
                                ),
                              ],
                            ),
                            Services(controller: _controller),
                          ],
                        ),
                      ),

                      Expanded(
                        child: ClipRRect(
                          // borderRadius: BorderRadius.circular(25),
                          borderRadius: BorderRadiusGeometry.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(25),
                            color: theme.colorScheme.surface,
                            child: Center(
                              child: Column(
                                spacing: 15,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Histórico',
                                        style: theme.textTheme.titleMedium?.copyWith(
                                          color: theme.colorScheme.onSecondary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Icon(
                                        Icons.more_horiz,
                                        color: theme.colorScheme.onSecondary,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.secondary,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: ListTile(
                                      leading: Icon(Icons.favorite),
                                      title: Text(
                                        'Produto Cadastrado',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        'Um novo produto foi cadastradodasdasdsadadasdasdas',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.labelMedium,
                                      ),
                                      trailing: Icon(Icons.more),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
