import 'package:flutter/material.dart';
import 'package:m1_contador_progresivo/providers/config.provider.dart';
import 'package:provider/provider.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  @override
  Widget build(BuildContext context) {
    // ConfigProvider provider = Provider.of<ConfigProvider>(context);

    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey.shade400,
      currentIndex: Provider.of<ConfigProvider>(context).currentPage,
      elevation: 0,
      onTap: (int value) {
        Provider.of<ConfigProvider>(context, listen: false)
            .setCurrentPage(value);
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
