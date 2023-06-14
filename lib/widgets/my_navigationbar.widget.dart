import 'package:flutter/material.dart';
import 'package:m1_contador_progresivo/pages/config.page.dart';
import 'package:m1_contador_progresivo/pages/home.page.dart';
import 'package:m1_contador_progresivo/helpers/navigate.helper.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        if (value == 0) {
          navigate(context, const HomePage(title: 'Inicio'));
        } else {
          navigate(context, const ConfigPage());
        }
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.lock_clock),
          label: 'Contador',
          tooltip: 'Contador',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Configuración',
          tooltip: 'Configuración',
        ),
      ],
    );
  }
}
