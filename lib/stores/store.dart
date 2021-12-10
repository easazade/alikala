import 'package:flutter/material.dart';

class Store extends ChangeNotifier {
  void setState(Function callback) {
    callback();
    notifyListeners();
  }
}
