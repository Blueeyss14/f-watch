import 'package:f_smartwatch/src/features/views/pages/watch_menu.dart';
import 'package:f_smartwatch/src/features/views/pages/watch_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final pages = const [WatchPage(), WatchMenu()];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(scrollDirection: Axis.vertical, children: pages),
    );
  }
}
