import 'package:flutter/material.dart';
import 'package:m1_contador_progresivo/providers/config.provider.dart';
import 'package:m1_contador_progresivo/widgets/circle_button.widget.dart';
import 'package:m1_contador_progresivo/widgets/circle_img_buttom.widget.dart';
import 'package:provider/provider.dart';
import '../helpers/snackbar.helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  String _bg = '';

  void _incrementCounter() {
    int counterAmount = context.read<ConfigProvider>().counterAmount;
    setState(() => _counter = _counter + counterAmount);
  }

  void _decrementCounter() {
    int counterAmount = context.read<ConfigProvider>().counterAmount;
    setState(() => _counter = _counter - counterAmount);
  }

  void _cleanCounter(BuildContext context) {
    setState(() => _counter = 0);
    showSnackbar(context, 'Haz reiniciado el contador');
  }

  void _updateBg(String bg) {
    Provider.of<ConfigProvider>(context, listen: false).setAppBackground(bg);
  }

  @override
  Widget build(BuildContext context) {
    _bg = Provider.of<ConfigProvider>(context).appBackgorund;

    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.indigo,
            image: DecorationImage(image: AssetImage(_bg), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Cambiar fondo',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleImgButton(
                  action: () {
                    _updateBg(context.read<ConfigProvider>().bg1);
                  },
                  backgroundImg: context.read<ConfigProvider>().bg1,
                ),
                const SizedBox(width: 10.0),
                CircleImgButton(
                  action: () {
                    _updateBg(context.read<ConfigProvider>().bg2);
                  },
                  backgroundImg: context.read<ConfigProvider>().bg2,
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Text(
              '$_counter',
              style: const TextStyle(color: Colors.white, fontSize: 36.0),
            ),
            const SizedBox(height: 10.0),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleButton(
                    text: '-',
                    action: () => _decrementCounter(),
                    size: 60,
                  ),
                  const SizedBox(width: 10.0),
                  CircleButton(
                    text: 'Limpiar',
                    action: () => _cleanCounter(context),
                    size: 100,
                  ),
                  const SizedBox(width: 10.0),
                  CircleButton(
                    text: '+',
                    action: () => _incrementCounter(),
                    size: 60,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
