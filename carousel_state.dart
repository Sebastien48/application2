import 'dart:async';

class CarouselState {
  // ...existing code...

  Timer? timer;

  Timer? getTimer() {
    if (timer == null) {
      timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        // Logique pour changer de page
      });
    }
    return timer;
  }

  void resumeTimer() {
    getTimer();
  }

  void pauseTimer() {
    timer?.cancel();
    timer = null;
  }
}
