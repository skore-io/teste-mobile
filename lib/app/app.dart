import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teste_mobile/app/controller.dart';
import 'package:teste_mobile/app/routes/uol_routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class App extends StatefulWidget {
  const App({
    Key? key,
    required this.controller,
    this.child,
  }) : super(key: key);

  final Controller controller;
  final Widget? child;

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.controller,
        builder: (BuildContext context, Widget? child) {
          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
          return MaterialApp(
            onGenerateRoute: (settings) => routes(settings, widget.controller),
            home: widget.child,
          );
        });
  }
}
