import '../stores/home_store.dart';

class HomeController {
  final HomeStore homeStore;

  HomeController(this.homeStore);

  void increment() {
    homeStore.counter++;
  }

  void decrement() {
    homeStore.counter--;
  }
}
