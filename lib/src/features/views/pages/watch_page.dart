import 'package:f_smartwatch/src/shared/style/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:one_clock/one_clock.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class WatchPage extends StatelessWidget {
  const WatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    TimeOfDay now = TimeOfDay.now();
    int totalMinutes = now.hour * 60 + now.minute;
    double percent = totalMinutes == 0 ? 1.0 : totalMinutes / (24 * 60);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [blue1, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          shape: BoxShape.circle,
        ),
        child: CircularPercentIndicator(
          radius: MediaQuery.of(context).size.width / 2,
          lineWidth: 8,
          percent: percent.clamp(0.0, 1.0),
          animation: true,
          animationDuration: 1000,
          circularStrokeCap: CircularStrokeCap.round,
          backgroundColor: blue2,
          linearGradient: LinearGradient(
            colors: [blue3, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          center: Container(
            padding: const EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            child: AnalogClock(
              secondHandColor: blue2,
              tickColor: blue2,
              isLive: true,
              hourHandColor: blue2,
              minuteHandColor: blue2,
              showSecondHand: true,
              numberColor: blue2,
              showNumbers: true,
              showAllNumbers: true,
              textScaleFactor: 1.0,
              showTicks: true,
              showDigitalClock: true,
              datetime: DateTime.now(),
              digitalClockColor: blue2,
            ),
          ),
        ),
      ),
    );
  }
}
