import 'package:flutter/material.dart';
import 'package:m1_contador_progresivo/providers/config.provider.dart';
import 'package:m1_contador_progresivo/widgets/circle_button.widget.dart';
import 'package:provider/provider.dart';
import '../helpers/snackbar.helper.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  String _bg = '';

  @override
  Widget build(BuildContext context) {
    _bg = Provider.of<ConfigProvider>(context).appBackgorund;
    var pageBg = DecorationImage(image: AssetImage(_bg), fit: BoxFit.cover);

    return Center(
        child: Container(
            decoration: BoxDecoration(color: Colors.indigo, image: pageBg),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text('Configurar contador',
                  style: TextStyle(color: Colors.white, fontSize: 20.0)),
              const SizedBox(height: 20.0),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: '¿Cuanto va a incrementar?',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white70),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onChanged: (String value) {
                      try {
                        int numberValue = int.parse(value);
                        Provider.of<ConfigProvider>(context, listen: false)
                            .setCounterAmount(numberValue);
                      } catch (_) {}
                    },
                    initialValue: Provider.of<ConfigProvider>(context)
                        .counterAmount
                        .toString(),
                  )),
              const SizedBox(height: 10.0),
              CircleButton(
                  text: 'Guardar',
                  action: () =>
                      showSnackbar(context, 'Configuración Actualizada'),
                  size: 100)
            ])));
  }
}
