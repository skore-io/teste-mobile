import 'package:flutter/material.dart';

import 'colors_palette.dart';

ThemeData lightTheme() {
  return ThemeData(
    primaryColor: const DefaultColorsPalette().primary,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
