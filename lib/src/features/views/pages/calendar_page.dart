import 'package:f_smartwatch/src/shared/style/custom_color.dart';
import 'package:f_smartwatch/src/shared/widget/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final weeks = const ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

    DateTime now = DateTime.now();
    int year = now.year;
    int month = now.month;

    DateTime firstDayOfMonth = DateTime(year, month, 1);
    int daysInMonth = DateTime(year, month + 1, 0).day;
    int startingWeekday = firstDayOfMonth.weekday % 7;

    List<Widget> dayWidgets = [];

    for (int i = 0; i < startingWeekday; i++) {
      dayWidgets.add(Container());
    }

    for (int i = 1; i <= daysInMonth; i++) {
      dayWidgets.add(
        Container(
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: i == now.day ? blue2 : Colors.transparent,
            borderRadius: BorderRadius.circular(5),
          ),
          alignment: Alignment.center,
          child: Text(
            '$i',
            style: TextStyle(
              fontSize: 8,
              fontWeight: i == now.day ? FontWeight.bold : FontWeight.normal,
              color: i == now.day ? Colors.white : Colors.black,
            ),
          ),
        ),
      );
    }

    return GradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new_sharp,
                      size: 13,
                      color: blue3,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    DateFormat('MMMM yyyy').format(now),
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: blue3,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int i = 0; i < weeks.length; i++)
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(1.5),
                        height: 12,
                        decoration: BoxDecoration(
                          color:
                              i == now.weekday % 7 ? blue2 : Colors.transparent,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Text(
                          weeks[i],
                          style: TextStyle(
                            fontSize: 7,
                            fontWeight: FontWeight.bold,
                            color: i == now.weekday % 7 ? Colors.white : blue3,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 2),
              Expanded(
                child: GridView.count(crossAxisCount: 7, children: dayWidgets),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
