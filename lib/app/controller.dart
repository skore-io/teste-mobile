import 'package:flutter/widgets.dart';
import 'package:teste_mobile/dependency_injection/injector.dart';


class Controller with ChangeNotifier {
  Controller();

  void loadDependencyInjection() {
    Injector()();
  }

  call() async {
    loadDependencyInjection();
  }
}
