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

  Widget _getPage(int page) {
    if (page == 0) {
      return const HomePage(title: '');
    } else if (page == 1) {
      return const ConfigPage();
    } else {
      return const HomePage(title: '');
    }
  }

  @override
  Widget build(BuildContext context) {
    ConfigProvider configProvider = context.read<ConfigProvider>();
    _page = configProvider.currentPage;

    return Scaffold(
      extendBody: true,
      body: Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 8, 136, 210)),
          child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _page == 0 ? _getPage(_page) : _getPage(_page))),
      bottomNavigationBar: const MyNavigationBar(),
    );
  }
}
