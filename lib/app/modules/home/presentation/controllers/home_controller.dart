import '../stores/home_store.dart';
import '../stores/states/counter_failure_state.dart';
import '../stores/states/counter_loading_state.dart';
import '../stores/states/counter_success_state.dart';

class HomeController {
  final HomeStore homeStore;

  HomeController(this.homeStore);

  Future<void> increment() async {
    homeStore.counterState = CounterLoadingState();

    await Future.delayed(const Duration(milliseconds: 300));
    homeStore.counter++;

    homeStore.counterState = CounterSuccessState();
  }

  Future<void> decrement() async {
    homeStore.counterState = CounterLoadingState();

    await Future.delayed(const Duration(milliseconds: 300));
    homeStore.counter--;

    if (homeStore.counter < 0) {
      homeStore.counterState = CounterFailureState(message: 'Valor menor que 0');
    } else {
      homeStore.counterState = CounterSuccessState();
    }
  }
}
