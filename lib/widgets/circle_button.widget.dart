import 'package:flutter/material.dart';

class CircleButton extends StatefulWidget {
  const CircleButton({
    super.key,
    required this.text,
    required this.action,
    required this.size,
  });

  final String text;
  final dynamic action;
  final double size;

  @override
  State<CircleButton> createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withAlpha(40),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(fontSize: 16.0, color: Colors.white),
          ),
        ),
      ),
      onTap: () {
        widget.action();
      },
    );
  }
}
