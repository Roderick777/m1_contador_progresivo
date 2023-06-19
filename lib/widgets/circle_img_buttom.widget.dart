import 'package:flutter/material.dart';

class CircleImgButton extends StatelessWidget {
  const CircleImgButton({
    super.key,
    required this.action,
    required this.backgroundImg,
  });

  final Function action;
  final String backgroundImg;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        action();
      },
      child: CircleAvatar(
        radius: 30,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        child: CircleAvatar(
          backgroundImage: AssetImage(backgroundImg),
          radius: 28,
        ),
      ),
    );
  }
}
