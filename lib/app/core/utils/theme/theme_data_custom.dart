import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeDataCustom {
  ThemeData get theme => ThemeData(
      backgroundColor: const Color(0xff24252A),
      primaryColor: const Color(0xffffcb2a),
      splashColor: Colors.white,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: const Color(0xffffcb2a),
        ),
      ),
      dialogTheme: const DialogTheme(backgroundColor: Color(0xff1a1b1f)),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff1a1b1f),
      ),
      cardColor: const Color(0xff1a1b1f),
      cupertinoOverrideTheme: const CupertinoThemeData(
        primaryColor: Color(0xffffcb2a),
        primaryContrastingColor: Color(0xffffcb2a),
        barBackgroundColor: Color(0xffffcb2a),
        scaffoldBackgroundColor: Color(0xffffcb2a),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Color(0xff1a1b1f),
        elevation: 15,
      ),
      textTheme: TextStyleTheme().textTheme,
      iconTheme: const IconThemeData(color: Colors.white, size: 20),
      scaffoldBackgroundColor: const Color(0xff24252A));
}

class TextStyleTheme {
  TextTheme get textTheme => TextTheme(
        bodyText1: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        bodyText2: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xffffcb2a),
        ),
        button: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        subtitle1: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        subtitle2: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Colors.grey[300],
        ),
        headline1: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        headline2: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
        headline3: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xffffcb2a),
        ),
        headline4: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        headline5: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xffffcb2a),
        ),
        headline6: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Color(0xffffcb2a),
        ),
      );
}
