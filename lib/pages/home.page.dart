import 'package:flutter/material.dart';
import 'package:m1_contador_progresivo/providers/config.provider.dart';
import 'package:m1_contador_progresivo/widgets/circle_button.widget.dart';
import 'package:m1_contador_progresivo/widgets/my_appbar.widget.dart';
import 'package:m1_contador_progresivo/widgets/my_navigationbar.widget.dart';
import 'package:provider/provider.dart';
import '../helpers/snackbar.helper.dart';
import '../providers/color.provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  Color _color = Colors.blue;

  void _incrementCounter() {
    int counterAmount =
        Provider.of<ConfigProvider>(context, listen: false).counterAmount;
    setState(() => _counter = _counter + counterAmount);
  }

  void _decrementCounter() {
    int counterAmount =
        Provider.of<ConfigProvider>(context, listen: false).counterAmount;
    setState(() => _counter = _counter - counterAmount);
  }

  void _cleanCounter(BuildContext context) {
    setState(() => _counter = 0);
    showSnackbar(context, 'Haz reiniciado el contador');
  }

  void _updateColor(Color color) {
    // setState(() => _color = color);
    Provider.of<ColorProvider>(context, listen: false).setColor(color);
  }

  List<Widget> _colorElements() {
    List<Color> colors = [
      Colors.blue,
      Colors.deepPurple,
      Colors.amber,
      Colors.green
    ];
    List<Widget> elements = [];
    colors.forEach((e) {
      elements.add(CircleButton(
          content: const Text(''), action: () => _updateColor(e), color: e));
    });
    return elements;
  }

  @override
  Widget build(BuildContext context) {
    _color = Provider.of<ColorProvider>(context).color;

    return Scaffold(
      appBar: const MyAppBar(title: 'Inicio'),
      body: Center(
          child: Container(
        decoration: BoxDecoration(color: _color.withAlpha(50)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Cambiar color"),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [..._colorElements()]),
            Text('$_counter',
                style: Theme.of(context).textTheme.headlineMedium),
            Center(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Theme(
                  data: Theme.of(context)
                      .copyWith(iconTheme: IconThemeData(color: _color)),
                  child: IconButton(
                      onPressed: () => _decrementCounter(),
                      color: _color,
                      icon: const Text('-', style: TextStyle(fontSize: 16.0))),
                ),
                const SizedBox(width: 10.0),
                IconButton(
                    iconSize: 50.0,
                    onPressed: () => _cleanCounter(context),
                    icon: const Text('Limpiar')),
                const SizedBox(width: 10.0),
                Theme(
                    data: Theme.of(context)
                        .copyWith(iconTheme: IconThemeData(color: _color)),
                    child: IconButton(
                        onPressed: () => _incrementCounter(),
                        color: _color,
                        icon:
                            const Text('+', style: TextStyle(fontSize: 16.0))))
              ]),
            )
          ],
        ),
      )),
      bottomNavigationBar: const MyNavigationBar(),
    );
  }
}
