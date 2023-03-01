import 'counter_states.dart';

class CounterFailureState implements CounterStates {
  final String message;

  CounterFailureState({required this.message});
}
