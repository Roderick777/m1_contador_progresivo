import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton(
      {super.key,
      required this.content,
      required this.action,
      required this.color});
  final Widget content;
  final dynamic action;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(
          color: Colors.grey.shade300,
          width: 2.0,
        ),
      ),
      child: InkWell(onTap: () => action(), child: Center(child: content)),
    );
  }
}
