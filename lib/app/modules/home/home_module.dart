import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/controllers/home_controller.dart';
import 'presentation/home_page.dart';
import 'presentation/stores/home_store.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => HomeStore()),
    Bind((i) => HomeController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const HomePage()),
  ];
}
