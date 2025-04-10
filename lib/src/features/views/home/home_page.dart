import 'dart:ui';

import 'package:circular_menu/circular_menu.dart';
import 'package:f_smartwatch/src/features/models/UI/ui_model.dart';
import 'package:f_smartwatch/src/features/views/pages/chat_page.dart';
import 'package:f_smartwatch/src/features/views/pages/watch_menu.dart';
import 'package:f_smartwatch/src/features/views/pages/watch_page.dart';
import 'package:f_smartwatch/src/shared/style/custom_color.dart';
import 'package:f_smartwatch/src/shared/widget/gradient_background.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final pages = const [WatchPage(), WatchMenu(), ChatPage()];

class _HomePageState extends State<HomePage> {
  static int currentIndex = 0;

  PageController pageController = PageController();

  int clicked = 0;

  void pageIndex(int index) {
    currentIndex = index;
    pageController.animateToPage(
      currentIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<CircularMenuModel> circularMenu = CircularMenuModel.circularMenu(
      currentIndex,
    );
    return Stack(
      children: [
        GradientBackground(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: PageView(
              controller: pageController,
              scrollDirection: Axis.vertical,
              children: pages,
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
            ),
          ),
        ),

        if (clicked == 1)
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Container(
              color: blue2.withAlpha(80),
              width: double.infinity,
              height: double.infinity,
            ),
          ),

        CircularMenu(
          toggleButtonBoxShadow: [
            BoxShadow(
              color: blue2.withAlpha(100),
              blurRadius: 10,
              spreadRadius: 1,
              offset: const Offset(0, 0),
            ),
          ],
          toggleButtonColor: blue2,
          toggleButtonIconColor: Colors.white,
          toggleButtonOnPressed: () {
            setState(() {
              clicked++;
              if (clicked > 1) {
                clicked = 0;
              }
            });
          },
          radius: 40,
          alignment: Alignment.bottomRight,
          toggleButtonSize: 10,
          toggleButtonPadding: 5,
          toggleButtonMargin: 8,
          items: List.generate(
            circularMenu.length,
            (index) => CircularMenuItem(
              boxShadow: [
                BoxShadow(
                  color: blue2.withAlpha(100),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(0, 0),
                ),
              ],
              iconColor: Colors.white,
              color: blue2,
              padding: 8,
              iconSize: 10,
              margin: 5,
              icon: circularMenu[index].icon.icon,
              onTap: () {
                pageIndex(index);
              },
            ),
          ),
        ),
      ],
    );
  }
}
