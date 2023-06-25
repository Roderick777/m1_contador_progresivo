import 'package:flutter/material.dart';
import 'package:m1_contador_progresivo/pages/config.page.dart';
import 'package:m1_contador_progresivo/pages/home.page.dart';
import 'package:m1_contador_progresivo/providers/config.provider.dart';
import 'package:m1_contador_progresivo/widgets/my_navigationbar.widget.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    _page = Provider.of<ConfigProvider>(context).currentPage;

    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 8, 136, 210),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _page == 0 ? const HomePage(title: '') : const ConfigPage(),
        ),
      ),
      bottomNavigationBar: const MyNavigationBar(),
    );
  }
}
