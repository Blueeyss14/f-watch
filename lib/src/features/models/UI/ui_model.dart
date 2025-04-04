import 'package:flutter/material.dart';

class CircularMenuModel {
  Icon icon;

  CircularMenuModel(this.icon);

  static List<CircularMenuModel> circularMenu() {
    List<Map<String, dynamic>> datas = [
      {"icon": Icons.home},
      {"icon": Icons.search},
      {"icon": Icons.chat},
    ];

    return datas.map((data) => CircularMenuModel(Icon(data["icon"]))).toList();
  }
}
