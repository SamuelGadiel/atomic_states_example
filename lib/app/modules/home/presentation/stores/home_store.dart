import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

class HomeStore {
  final ValueNotifier<int> _counter = RxNotifier<int>(0);
  
  int get counter => _counter.value;
  set counter(int value) => _counter.value = value;
}
