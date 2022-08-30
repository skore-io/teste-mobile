import 'package:flutter/material.dart';
import 'package:skore_mobile_challenge/core/service_locator.dart';
import 'package:skore_mobile_challenge/presentation/app_theme_data.dart';
import 'package:skore_mobile_challenge/presentation/home_page.dart';

void main() async {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skore Mobile Challenge',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      home: const MyHomePage(title: 'Skore Mobile Challenge'),
    );
  }
}
