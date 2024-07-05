import 'package:flutter/material.dart';

class CounterController extends ChangeNotifier {
  int count = 0;

  void decrement() {
    count--;
    notifyListeners();
  }

  void increment() {
    count++;
    notifyListeners();
  }
}
