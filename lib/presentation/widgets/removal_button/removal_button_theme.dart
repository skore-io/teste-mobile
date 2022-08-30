import 'package:flutter/material.dart';

RemovalButtonTheme lightRemovalButtonTheme = RemovalButtonTheme(
  background: Colors.blueGrey[200]!,
  iconColor: const Color.fromARGB(255, 232, 33, 19),
  splashColor: const Color.fromARGB(255, 232, 33, 19),
);

RemovalButtonTheme darkRemovalButtonTheme = RemovalButtonTheme(
  background: Colors.blueGrey[800]!,
  splashColor: const Color.fromARGB(255, 232, 33, 19),
);

@immutable
class RemovalButtonTheme extends ThemeExtension<RemovalButtonTheme> {
  const RemovalButtonTheme({
    this.background = Colors.white,
    this.iconColor = Colors.red,
    this.splashColor = Colors.red,
  });

  final Color background;
  final Color iconColor;
  final Color splashColor;

  @override
  RemovalButtonTheme copyWith({
    Color? background,
    Color? iconColor,
    Color? splashColor,
  }) {
    return RemovalButtonTheme(
      background: background ?? this.background,
      iconColor: iconColor ?? this.iconColor,
      splashColor: splashColor ?? this.splashColor,
    );
  }

  @override
  RemovalButtonTheme lerp(ThemeExtension<RemovalButtonTheme>? other, double t) {
    if (other is! RemovalButtonTheme) {
      return this;
    }
    return RemovalButtonTheme(
      background: Color.lerp(background, other.background, t) ?? Colors.white,
      iconColor: Color.lerp(iconColor, other.iconColor, t) ?? Colors.white,
      splashColor: Color.lerp(splashColor, other.splashColor, t) ?? Colors.white,
    );
  }

  @override
  String toString() => 'MyCardTheme('
      'background: $background, iconColor: $iconColor, splashColor: $splashColor'
      ')';
}
