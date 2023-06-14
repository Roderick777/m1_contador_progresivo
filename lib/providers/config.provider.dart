import 'package:flutter/material.dart';

class ConfigProvider with ChangeNotifier {
  int _counterAmount = 1;

  int get counterAmount => _counterAmount;

  void setCounterAmount(int newCounterAmount) {
    _counterAmount = newCounterAmount;
    notifyListeners();
  }
}
