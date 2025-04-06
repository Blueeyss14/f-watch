import 'package:f_smartwatch/src/features/views/components/calendar.dart';
import 'package:f_smartwatch/src/features/views/components/temperature.dart';
import 'package:f_smartwatch/src/features/views/components/time.dart';
import 'package:f_smartwatch/src/shared/style/custom_color.dart';
import 'package:flutter/material.dart';

class WatchMenu extends StatelessWidget {
  const WatchMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue1,
      body: Center(
        child: Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width / 1.5,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(child: buildCalendar(context)),
              const SizedBox(height: 5),
              Row(
                children: [
                  Flexible(child: buildTime(context)),
                  const SizedBox(width: 5),
                  buildTemperature(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
