import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_estoque/domain/enums/services_enum.dart';
import 'package:meu_estoque/ui/home/viewmodel/home_controller.dart';
import 'package:meu_estoque/ui/home/viewmodel/home_states.dart';
import 'package:meu_estoque/ui/home/widgets/services_card.dart';

class Services extends StatelessWidget {
  const Services({
    super.key,
    required HomeController controller,
  }) : _controller = controller;

  final HomeController _controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Serviços',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        for (final service in ServicesEnum.values)
          ServicesCard(
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
    );
  }
}
