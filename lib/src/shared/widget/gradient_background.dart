import 'package:f_smartwatch/src/shared/style/custom_color.dart';
import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget? child;
  const GradientBackground({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [blue1, Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}
