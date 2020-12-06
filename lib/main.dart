import 'package:flutter/material.dart';
import 'package:minhas_aulas/routes.dart';
import 'package:minhas_aulas/themes/light_theme.dart';

import './injection_container.dart' as dependecy_injection;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  dependecy_injection.init();
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme(),
      routes: routes,
    );
  }
}
