import 'dart:async';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meu_estoque/routing/routes.dart';
import 'package:meu_estoque/ui/home/viewmodel/home_states.dart';

class HomeController extends GetxController {
  final StreamController<HomeStates> _homeStateController = StreamController<HomeStates>.broadcast();

  final Rx<HomeStates> _homeState = Rx<HomeStates>(HomeInitialState());

  HomeStates get state => _homeState.value;

  final String todayFormatted = DateFormat('dd MMM yyyy', 'pt_BR').format(DateTime.now());

  @override
  void onInit() {
    _homeState.bindStream(_homeStateController.stream);
    super.onInit();
  }

  void goToAboutUsPage() {
    Get.toNamed(Routes.about);
  }
}
