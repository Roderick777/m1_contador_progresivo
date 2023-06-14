import 'package:flutter/material.dart';
import 'package:m1_contador_progresivo/providers/color.provider.dart';
import 'package:m1_contador_progresivo/providers/config.provider.dart';
import 'package:m1_contador_progresivo/widgets/my_appbar.widget.dart';
import 'package:m1_contador_progresivo/widgets/my_navigationbar.widget.dart';
import 'package:provider/provider.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  Color _color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    _color = Provider.of<ColorProvider>(context).color;

    return Scaffold(
      appBar: const MyAppBar(title: 'Configuración'),
      body: Center(
          child: Container(
              decoration: BoxDecoration(color: _color.withAlpha(50)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Configuración'),
                    Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: '¿Cuanto va a incrementar?'),
                          onChanged: (String value) {
                            try {
                              int numberValue = int.parse(value);
                              Provider.of<ConfigProvider>(context,
                                      listen: false)
                                  .setCounterAmount(numberValue);
                            } catch (e) {
                              print(e.toString());
                            }
                          },
                          initialValue: Provider.of<ConfigProvider>(context)
                              .counterAmount
                              .toString(),
                        )),
                  ]))),
      bottomNavigationBar: const MyNavigationBar(),
    );
  }
}
