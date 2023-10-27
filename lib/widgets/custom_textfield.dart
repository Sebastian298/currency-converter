import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType keyboardType;
  final InputDecoration decoration;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final bool readOnly;
  final void Function(String)? onSubmitted;
  const CustomTextField({
    super.key,
    required this.keyboardType,
    required this.decoration,
    this.onChanged,
    this.controller,
    this.readOnly = false,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      decoration: decoration,
      onChanged: onChanged,
      controller: controller,
      readOnly: readOnly,
      onSubmitted: onSubmitted,
    );
  }
}
