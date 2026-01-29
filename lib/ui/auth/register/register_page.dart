import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'viewmodel/register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterPage'),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Column(
                      spacing: 15,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            label: Text('Nome', style: Theme.of(context).textTheme.bodyLarge),
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            label: Text('E-mail', style: Theme.of(context).textTheme.bodyLarge),
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            label: Text('E-mail', style: Theme.of(context).textTheme.bodyLarge),
                          ),
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
    );
  }
}
