import 'package:flutter/material.dart';

class Resources {
  static Map<int, Color> colorSwatch = {
    50: Color.fromRGBO(206, 178, 81, .1),
    100: Color.fromRGBO(206, 178, 81, .2),
    200: Color.fromRGBO(206, 178, 81, .3),
    300: Color.fromRGBO(206, 178, 81, .4),
    400: Color.fromRGBO(206, 178, 81, .5),
    500: Color.fromRGBO(206, 178, 81, .6),
    600: Color.fromRGBO(206, 178, 81, .7),
    700: Color.fromRGBO(206, 178, 81, .8),
    800: Color.fromRGBO(206, 178, 81, .9),
    900: Color.fromRGBO(206, 178, 81, 1),
  };

  static final MaterialColor customColorSwatch =
      MaterialColor(0xFF00CEB2, colorSwatch);
}
