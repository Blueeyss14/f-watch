import 'package:f_smartwatch/src/features/views/pages/gps_page.dart';
import 'package:f_smartwatch/src/features/views/pages/watch_menu.dart';
import 'package:f_smartwatch/src/features/views/pages/watch_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final pages = [const WatchPage(), const WatchMenu(), GpsPage()];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.black,
          body: PageView(scrollDirection: Axis.vertical, children: pages),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            margin: const EdgeInsets.all(5),
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
