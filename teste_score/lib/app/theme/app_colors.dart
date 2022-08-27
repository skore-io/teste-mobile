import 'package:flutter/material.dart';
import 'dart:core';

abstract class AppColors {
  Color get backgroundPrimary;
  Color get titleAppBar;
  MaterialColor get primary;

  final String hex = '0xff';
  final String colorFinal = '700391';
  final int hexFinal = 0;
}

class AppColorDefault implements AppColors {
  @override
  Color get backgroundPrimary => Colors.white;

  @override
  Color get titleAppBar => Colors.white;

  Map<int, Color> color = {
    50: const Color.fromRGBO(136, 14, 79, .1),
    100: const Color.fromRGBO(136, 14, 79, .2),
    200: const Color.fromRGBO(136, 14, 79, .3),
    300: const Color.fromRGBO(136, 14, 79, .4),
    400: const Color.fromRGBO(136, 14, 79, .5),
    500: const Color.fromRGBO(136, 14, 79, .6),
    600: const Color.fromRGBO(136, 14, 79, .7),
    700: const Color.fromRGBO(136, 14, 79, .8),
    800: const Color.fromRGBO(136, 14, 79, .9),
    900: const Color.fromRGBO(136, 14, 79, 1),
  };

  @override
  String get hex => '0xff';

  @override
  String get colorFinal => 'cf1f36';

  @override
  int get hexFinal => int.parse('$hex$colorFinal');

  @override
  MaterialColor get primary => MaterialColor(hexFinal, color);
}
