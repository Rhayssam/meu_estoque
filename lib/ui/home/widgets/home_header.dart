import 'package:flutter/material.dart';
import 'package:meu_estoque/ui/home/viewmodel/home_controller.dart';
import 'package:meu_estoque/ui/home/widgets/services.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    required this.theme,
    required HomeController controller,
  }) : _controller = controller;

  final ThemeData theme;
  final HomeController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      icon: const Icon(Icons.menu_rounded),
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
    );
  }
}
