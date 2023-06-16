import 'package:flutter/material.dart';

class CircleImgButton extends StatelessWidget {
  const CircleImgButton(
      {super.key, required this.action, required this.backgroundImg});
  final dynamic action;
  final String backgroundImg;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          action();
        },
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          child: CircleAvatar(
            backgroundImage:
                AssetImage(backgroundImg), // 'assets/images/fondopantalla2.jpg'
            radius: 28,
          ),
        ));
  }
}
