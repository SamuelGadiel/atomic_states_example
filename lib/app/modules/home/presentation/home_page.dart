import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'controllers/home_controller.dart';
import 'stores/home_store.dart';
import 'stores/states/counter_failure_state.dart';
import 'stores/states/counter_loading_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeStore = Modular.get<HomeStore>();
  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    context.select(() => homeStore.counterState);

    return Scaffold(
      appBar: AppBar(title: const Text('Estado atômico')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Quantidade de cliques'),
            Visibility(
              visible: homeStore.counterState is! CounterLoadingState,
              replacement: const CircularProgressIndicator(),
              child: Text(
                homeStore.counter.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 12),
            if (homeStore.counterState is CounterFailureState)
              Text(
                (homeStore.counterState as CounterFailureState).message,
                style: const TextStyle(color: Colors.red),
              ),
            const SizedBox(height: 24),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: homeController.increment,
                  child: const Text('Incrementar'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: homeController.decrement,
                  child: const Text('Decrementar'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
