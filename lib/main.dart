import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:skore/config/injection/app_injection.dart';
import 'package:skore/config/routes/app_router.gr.dart';

void main() {
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Skore App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        iconTheme: const IconThemeData(color: Colors.purple),
      ),
      routerDelegate: AutoRouterDelegate(_appRouter),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
