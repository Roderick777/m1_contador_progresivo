import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const MyAppBar({super.key, required this.title});
  final String title;
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white70,
      title: Text(title),
    );
  }
}
