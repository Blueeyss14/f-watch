import 'package:f_smartwatch/src/features/views/pages/chat_page.dart';
import 'package:f_smartwatch/src/features/views/pages/watch_menu.dart';
import 'package:f_smartwatch/src/features/views/pages/watch_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final pages = const [WatchPage(), WatchMenu(), ChatPage()];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color(0xFFD3E0F0), Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: PageView(scrollDirection: Axis.vertical, children: pages),
          ),
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
