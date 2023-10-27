import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final ButtonStyle? style;
  const CustomElevatedButton(
      {super.key, this.onPressed, this.child, this.style});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: child,
    );
  }
}
