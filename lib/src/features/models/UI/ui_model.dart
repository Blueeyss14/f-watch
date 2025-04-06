import 'package:flutter/material.dart';

class CircularMenuModel {
  Icon icon;

  CircularMenuModel(this.icon);

  static List<CircularMenuModel> circularMenu(int index) {
    List<Map<String, dynamic>> datas = [
      {"icon": index == 0 ? Icons.watch_off : Icons.watch},
      {"icon": Icons.dashboard_customize_outlined},
      {"icon": Icons.chat},
    ];

    return datas.map((data) => CircularMenuModel(Icon(data["icon"]))).toList();
  }
}
