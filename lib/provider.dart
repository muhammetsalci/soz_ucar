import 'package:flutter/material.dart';

class MyProvider with ChangeNotifier {
  int _myVariable = 0;

  int get myVariable => _myVariable;

  void setMyVariable() {
    _myVariable++;
    notifyListeners();
  }
}
