import 'package:get/get.dart';

class LoadingOverlayManager {
  LoadingOverlayManager._();

  final Rx<bool> _isLoading = false.obs;

  static LoadingOverlayManager? _instance;
  static LoadingOverlayManager get instance => _instance ??= LoadingOverlayManager._();

  bool get isLoading => _isLoading.value;

  void showLoading() => _isLoading.value = true;
  void hideLoading() => _isLoading.value = false;
}
