import 'package:f_smartwatch/src/shared/style/custom_color.dart';
import 'package:flutter/material.dart';

Widget buildTime(BuildContext context) {
  String time = TimeOfDay.now().format(context);

  return Container(
    clipBehavior: Clip.antiAlias,
    alignment: Alignment.center,
    height: 30,
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
        splashColor: Colors.white.withAlpha(100),
        onTap: () {},
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          color: Colors.transparent,
          child: Text(
            time,
            style: TextStyle(fontFamily: 'Digital7', fontSize: 12),
          ),
        ),
      ),
    ),
  );
}
