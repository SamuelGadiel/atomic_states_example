import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'states/counter_initial_state.dart';
import 'states/counter_states.dart';

class HomeStore {
  final ValueNotifier<CounterStates> _counterState = RxNotifier<CounterStates>(CounterInitialState());

  int counter = 0;

  CounterStates get counterState => _counterState.value;
  set counterState(CounterStates value) => _counterState.value = value;
}
