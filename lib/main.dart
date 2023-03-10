import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const RxRoot(child: AppWidget()),
    ),
  );
}
