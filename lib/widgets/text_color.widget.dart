import 'package:flutter/material.dart';

class ColorText extends StatelessWidget {
  const ColorText({super.key, required this.color, required this.text});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color),
    );
  }
}
