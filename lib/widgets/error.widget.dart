import 'package:flutter/material.dart';
import 'package:m1_contador_progresivo/widgets/text_color.widget.dart';

class ErrorFragmentWidget extends StatelessWidget {
  const ErrorFragmentWidget({super.key, required this.inputError});
  final bool inputError;

  @override
  Widget build(BuildContext context) {
    return inputError
        ? SizedBox(
            width: 250,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: const Color(0xFF222222),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.info,
                      color: Colors.red.shade300,
                    ),
                    const SizedBox(width: 10.0),
                    const ColorText(
                      color: Colors.white,
                      text: 'Debe ingresar un número válido',
                    ),
                  ],
                ),
              ),
            ),
          )
        : const SizedBox(height: 48, width: 250);
  }
}
