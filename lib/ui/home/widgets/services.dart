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
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: ServicesEnum.values.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final service = ServicesEnum.values[index];
        return ServicesCard(
          service: service,
          onTap: (service) {
            if (_controller.state is HomeLoadingCompaniesState) return;
            Get.toNamed(service.route);
          },
        );
      },
    );
  }
}
