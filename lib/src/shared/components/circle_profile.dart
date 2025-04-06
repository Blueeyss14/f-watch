import 'package:flutter/material.dart';

class CircleProfile extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Widget? child;
  final Function()? onTap;
  const CircleProfile({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.color,
    this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,
        width: width ?? 20,
        height: height ?? 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color ?? Colors.white,
        ),
        child: child,
      ),
    );
  }
}
