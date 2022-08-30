import 'package:flutter/material.dart';
import 'package:skore_mobile_challenge/presentation/widgets/removal_button/removal_button_theme.dart';

final lightThemeData = ThemeData(
  primarySwatch: Colors.blue,
  extensions: [
    lightRemovalButtonTheme,
  ],
);

final darkThemeData = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
  extensions: <ThemeExtension<dynamic>>[
    darkRemovalButtonTheme,
  ],
);
