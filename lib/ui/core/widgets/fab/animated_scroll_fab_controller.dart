part of 'animated_scroll_fab.dart';

enum FabStateEnum { close, open }

final class AnimatedScrollFabController extends GetxController with GetTickerProviderStateMixin {
  AnimatedScrollFabController({
    required this.scrollController,
    required this.durationMilliseconds,
    required this.scrollThreshold,
  });

  final ScrollController scrollController;
  final int durationMilliseconds;
  final int scrollThreshold;

  double endSize = 56;
  bool _hasInit = false;

  late final AnimationController _animationController;
  late final Tween<double> _sizeTween;
  late final Animation<double> sizeAnimation;

  final Rx<FabStateEnum> _fabState = FabStateEnum.open.obs;

  FabStateEnum get fabState => _fabState.value;
  double get buttonCurrentWidth => sizeAnimation.value;
  double get buttonExpandedWidth => _sizeTween.begin!;
  double get buttonCollapsedWidth => _sizeTween.end!;
  bool get isDismissed => _animationController.isDismissed;

  @override
  void onInit() {
    scrollController.addListener(_handleScroll);
    ever(_fabState, _handleScrollAnimation);
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.removeListener(_handleScroll);
    _animationController.dispose();
    super.onClose();
  }

  void setUpAnimation(double beginSize) {
    if (_hasInit) return;
    _hasInit = true;

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: durationMilliseconds),
    );

    _sizeTween = Tween<double>(
      begin: beginSize,
      end: endSize,
    );

    sizeAnimation = _sizeTween.animate(_animationController);
  }

  void _handleScrollAnimation(FabStateEnum value) {
    switch (value) {
      case FabStateEnum.close:
        _animationController.forward();
        break;
      case FabStateEnum.open:
        _animationController.reverse();
        break;
    }
  }

  void _handleScroll() {
    final bool onTop = scrollController.position.pixels < scrollThreshold;
    _fabState.value = onTop ? FabStateEnum.open : FabStateEnum.close;
  }
}
