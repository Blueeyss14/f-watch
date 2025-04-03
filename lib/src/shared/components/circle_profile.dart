import 'package:flutter/material.dart';

class CircleProfile extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Widget? child;
  const CircleProfile({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.color,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      width: width ?? 20,
      height: height ?? 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color ?? Colors.white,
      ),
      child: child,
    );
  }
}
