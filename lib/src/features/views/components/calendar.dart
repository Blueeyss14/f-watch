import 'package:f_smartwatch/src/shared/style/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget buildCalendar() {
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
    child: Row(
      children: [
        Container(
          height: double.infinity,
          width: 30,
          color: blue2,
          child: Icon(Icons.calendar_month, size: 15),
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
  );
}
