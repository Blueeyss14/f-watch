import 'package:f_smartwatch/src/shared/style/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:one_clock/one_clock.dart';

class WatchPage extends StatelessWidget {
  const WatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: blue1, shape: BoxShape.circle),
        child: AnalogClock(
          secondHandColor: Colors.black,
          tickColor: Colors.black,
          decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: Colors.black),
            color: Colors.transparent,
            shape: BoxShape.circle,
          ),
          width: 150.0,
          isLive: true,
          hourHandColor: Colors.black,
          minuteHandColor: Colors.black,
          showSecondHand: true,
          numberColor: Colors.black87,
          showNumbers: true,
          showAllNumbers: true,
          textScaleFactor: 1.0,
          showTicks: true,
          showDigitalClock: true,
          datetime: DateTime.now(),
        ),
      ),
    );
  }
}
