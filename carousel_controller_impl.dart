import 'package:flutter/widgets.dart';
import 'carousel_controller.dart';

class CarouselControllerImpl extends CarouselController {
  final PageController _pageController;

  CarouselControllerImpl(this._pageController);

  @override
  Future<void> animateToPage(
    int page, {
    required Duration duration,
    required Curve curve,
  }) {
    return _pageController.animateToPage(
      page,
      duration: duration,
      curve: curve,
    );
  }

  @override
  void jumpToPage(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  Future<void> nextPage({required Duration duration, required Curve curve}) {
    return _pageController.nextPage(duration: duration, curve: curve);
  }

  @override
  Future<void> previousPage({
    required Duration duration,
    required Curve curve,
  }) {
    return _pageController.previousPage(duration: duration, curve: curve);
  }

  @override
  int get initialPage => _pageController.initialPage;

  @override
  bool get hasClients => _pageController.hasClients;

  @override
  int get page => _pageController.page?.round() ?? 0;

  @override
  void dispose() {
    _pageController.dispose();
  }
}
