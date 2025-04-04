import 'package:f_smartwatch/src/shared/style/custom_color.dart';
import 'package:flutter/material.dart';

class WatchMenu extends StatelessWidget {
  const WatchMenu({super.key});

  @override
  Widget build(BuildContext context) {
    String time = TimeOfDay.now().format(context);

    return Scaffold(
      backgroundColor: blue1,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              alignment: Alignment.center,
              height: 20,
              width: MediaQuery.of(context).size.width / 2,
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
              child: Text(time, style: TextStyle(fontFamily: 'Digital7')),
            ),
          ),
        ],
      ),
    );
  }
}
