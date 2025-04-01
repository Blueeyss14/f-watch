import 'package:flutter/material.dart';
import 'package:one_clock/one_clock.dart';

class WatchPage extends StatelessWidget {
  const WatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
