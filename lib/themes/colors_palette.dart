import 'dart:ui';

abstract class ColorsPalette {
  const ColorsPalette();
  Color get primary;
  Color get dark;
  Color get light;
  Color get background;
  Color get error;
  TypographyColor get text;
}

class DefaultColorsPalette extends ColorsPalette {
  const DefaultColorsPalette();
  @override
  Color get background => const Color(0xFFE5E5E5);
  @override
  // Color get primary => const Color(0xFF2A3BD2);
  Color get primary => const Color(0xFF2E8B57);
  @override
  Color get dark => const Color(0xFFD7D7D7);
  @override
  Color get error => const Color(0xFFF55858);
  @override
  Color get light => const Color(0xFFFFFFFF);
  @override
  TypographyColor get text => const DefaultTypographyColor();
}

abstract class TypographyColor {
  const TypographyColor();
  Color get body1;
  Color get body2;
  Color get display;
  Color get button;
  Color get subhead;
}

class DefaultTypographyColor extends TypographyColor {
  const DefaultTypographyColor();
  @override
  Color get body1 => const Color(0xFF696969);

  @override
  Color get body2 => const Color(0xFF9B9B9B);

  @override
  Color get button => DefaultColorsPalette().light;

  @override
  Color get display => const Color(0xFFF9F9F9);

  @override
  Color get subhead => const Color(0xFF585858);
}
