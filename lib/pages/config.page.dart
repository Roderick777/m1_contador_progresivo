import 'package:flutter/material.dart';
import 'package:m1_contador_progresivo/providers/config.provider.dart';
import 'package:m1_contador_progresivo/widgets/circle_button.widget.dart';
import 'package:m1_contador_progresivo/widgets/error.widget.dart';
import 'package:provider/provider.dart';
import '../helpers/snackbar.helper.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  String _bg = '';
  bool _error = false;

  @override
  Widget build(BuildContext context) {
    _bg = Provider.of<ConfigProvider>(context).appBackgorund;
    var pageBg = DecorationImage(image: AssetImage(_bg), fit: BoxFit.cover);

    InputDecoration getInputStyle() {
      return const InputDecoration(
        hintText: '1,2,3...',
        hintStyle: TextStyle(color: Color(0xFFE5E5E5)),
        labelText: '¿Cuanto va a incrementar?',
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white70),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      );
    }

    void onInputChange(String value) {
      try {
        if (_error) {
          setState(() => _error = false);
        }
        int numberValue = int.parse(value);
        Provider.of<ConfigProvider>(context, listen: false)
            .setCounterAmount(numberValue);
      } catch (_) {
        setState(() => _error = true);
      }
    }

    return Center(
      child: Container(
        decoration: BoxDecoration(color: Colors.indigo, image: pageBg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Configurar contador',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: getInputStyle(),
                onChanged: onInputChange,
                initialValue: Provider.of<ConfigProvider>(context)
                    .counterAmount
                    .toString(),
              ),
            ),
            const SizedBox(height: 10.0),
            CircleButton(
              text: 'Guardar',
              action: () {
                if (!_error) {
                  showSnackbar(context, 'Configuración Actualizada');
                }
              },
              size: 100,
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  height: 50,
                  child: ErrorFragmentWidget(inputError: _error),
                ))
          ],
        ),
      ),
    );
  }
}
