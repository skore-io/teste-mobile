import 'package:flutter/material.dart';
import 'package:teste_mobile_fernando_wahl/app/core/utils/fontFamily.dart';
import 'package:teste_mobile_fernando_wahl/app/core/utils/hexcolor.dart';


class AppTheme {
  static get themeData => ThemeData(
        
        brightness: Brightness.light,
        primaryColor: HexColor("00CEB2"),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(shadowColor: Color.fromRGBO(166, 171, 189, 0.2)),
        cardTheme: CardTheme(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Colors.white,
          elevation: 4,
          shadowColor: Color.fromRGBO(166, 171, 189, 0.2),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: HexColor("ECEDF1"),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: FontFamily.poppins,
        textTheme: TextTheme(
          headline1:TextStyle(fontFamily: FontFamily.poppins, fontSize: 15.0, fontWeight: FontWeight.bold, color: HexColor("4F4F4F")),
          headline2: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold, color: HexColor("4F4F4F")),
          subtitle1: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold, color: HexColor("4F4F4F")),
          subtitle2: TextStyle(fontSize: 19.0, color: HexColor("4F4F4F")),
          bodyText1: TextStyle(fontSize: 15.0, color: HexColor("4F4F4F")),
          bodyText2: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: HexColor("4F4F4F")),
          caption: TextStyle(fontSize: 11.0, color: HexColor("4F4F4F"), height: 1.1),
        ),
      );
}
