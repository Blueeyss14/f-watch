import 'package:f_smartwatch/src/features/views/pages/calendar_page.dart';
import 'package:f_smartwatch/src/shared/style/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget buildCalendar(BuildContext context) {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('EEE d MMMM', 'en_US').format(now);
  return Container(
    clipBehavior: Clip.antiAlias,
    alignment: Alignment.center,
    height: 25,
    decoration: BoxDecoration(
      color: blue1,
      borderRadius: BorderRadius.circular(7),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFF9DA9BB),
          offset: Offset(8, 8),
          blurRadius: 10,
          spreadRadius: 1,
        ),
        BoxShadow(
          color: const Color(0xFFC6D3E4),
          offset: Offset(-10, -5),
          blurRadius: 15,
          spreadRadius: 1,
        ),
      ],
    ),
    child: Material(
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => const CalendarPage()));
        },
        splashColor: Colors.white.withAlpha(100),
        child: Container(
          color: Colors.transparent,
          width: double.infinity,
          height: double.infinity,
          child: Row(
            children: [
              Container(
                height: double.infinity,
                width: 30,
                color: blue2,
                child: Icon(Icons.calendar_month, size: 15, color: blue1),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    formattedDate,
                    style: TextStyle(fontFamily: 'Digital7', fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
