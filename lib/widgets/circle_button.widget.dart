import 'package:flutter/material.dart';

class CircleButton extends StatefulWidget {
  const CircleButton({
    super.key,
    required this.text,
    required this.action,
    required this.size,
  });

  final String text;
  final Function action;
  final double size;

  @override
  State<CircleButton> createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            widget.action();
          },
          child: Container(
            width: widget.size,
            height: widget.size,
            color: Colors.white.withAlpha(40),
            child: Center(
              child: Text(
                widget.text,
                style: const TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
