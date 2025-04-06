import 'dart:async';

import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  int selectedMinute = 0;
  int selectedSecond = 0;

  Timer? timer;
  bool isRunning = false;
  int remainingSeconds = 0;

  void startTimer() {
    if (remainingSeconds == 0) {
      remainingSeconds = selectedMinute * 60 + selectedSecond;
      notifyListeners();
    }

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingSeconds <= 0) {
        timer.cancel();

        isRunning = false;
        notifyListeners();
      } else {
        remainingSeconds--;
        notifyListeners();
      }
    });

    isRunning = true;
    notifyListeners();
  }

  void pauseTimer() {
    timer?.cancel();
    isRunning = false;
    notifyListeners();
  }

  void resetTimer() {
    timer?.cancel();
    isRunning = false;
    remainingSeconds = 0;
    notifyListeners();
  }
}
