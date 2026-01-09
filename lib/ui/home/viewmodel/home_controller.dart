import 'dart:async';

import 'package:get/get.dart';
import 'package:meu_estoque/ui/home/viewmodel/home_states.dart';

class HomeController extends GetxController {
  final StreamController<HomeStates> _homeStateController = StreamController<HomeStates>.broadcast();
  final Rx<HomeStates> _homeState = Rx<HomeStates>(HomeInitialState());

  HomeStates get state => _homeState.value;

  @override
  void onInit() async {
    _homeState.bindStream(_homeStateController.stream);
    super.onInit();
  }
}
