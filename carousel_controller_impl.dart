import '/c:/Users/KOUAME/Desktop/FLUTTER/application mobile/artix/artix/carousel_state.dart';

class CarouselControllerImpl {
  CarouselState? state;

  void startAutoPlay() {
    state?.resumeTimer();
  }
}
