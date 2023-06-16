import 'package:flutter/material.dart';

class ConfigProvider with ChangeNotifier {
  int _counterAmount = 1;
  final String _bg1 = 'assets/images/fondopantalla.jpeg';
  final String _bg2 = 'assets/images/fondopantalla2.jpg';
  String _appBackground = 'assets/images/fondopantalla.jpeg';
  int _currentPage = 0;

  int get counterAmount => _counterAmount;
  String get appBackgorund => _appBackground;
  String get bg1 => _bg1;
  String get bg2 => _bg2;
  int get currentPage => _currentPage;

  void setCounterAmount(int newCounterAmount) {
    _counterAmount = newCounterAmount;
    notifyListeners();
  }

  void setAppBackground(String bg) {
    _appBackground = bg;
    notifyListeners();
  }

  void setCurrentPage(int newPageIndex) {
    _currentPage = newPageIndex;
    notifyListeners();
  }
}
