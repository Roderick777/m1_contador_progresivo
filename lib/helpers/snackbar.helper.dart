import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String text, {int duration = 2}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      duration: Duration(seconds: duration),
      actionOverflowThreshold: 1,
      behavior: SnackBarBehavior.floating, // Comportamiento del Snackbar
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // Forma del Snackbar
      ),
    ),
  );
}
