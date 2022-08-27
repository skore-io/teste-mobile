import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_score/app/theme/app_theme.dart';
import 'package:teste_score/app/utils/navigation_service.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setNavigatorKey(NavigationService.navigatorKey);

    return MaterialApp.router(
      title: 'Score',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: AppTheme.colors.primary,
        scaffoldBackgroundColor: AppTheme.colors.backgroundPrimary,
        appBarTheme: AppBarTheme(
          backgroundColor: AppTheme.colors.primary,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
