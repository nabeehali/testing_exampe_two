import 'package:flutter/material.dart';

class Counter {
  int value;

  Counter({this.value = 0});
  Key minusButtonKey = const ValueKey('minusButton');
  void incrementCounter() {
    value++;
  }

  void decrementCounter() {
    value--;
  }
}
