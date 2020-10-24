import 'package:flutter/material.dart';

import 'appcolors.style.dart';

class AppTheme {
  static get themeData => ThemeData(
        // Define the default brightness and colors
        brightness: Brightness.light,
        primaryColor: AppColors.PRIMARY,
        accentColor: AppColors.GRAY4F,
        visualDensity: VisualDensity.adaptivePlatformDensity,

        //Define the default appbar theme
        appBarTheme: AppBarTheme(shadowColor: AppColors.SHADOW),

        //Define the default card theme
        cardTheme: CardTheme(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Colors.white,
          elevation: 4,
          shadowColor: AppColors.SHADOW,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: AppColors.GRAYEC,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),

        scaffoldBackgroundColor: Colors.white,

        // Define the default font family
        fontFamily: 'Nunito',

        // Define the default TextTheme
        textTheme: TextTheme(
          headline1:
              TextStyle(fontFamily: "Montserrat", fontSize: 15.0, fontWeight: FontWeight.bold, color: AppColors.GRAY4F),
          headline2: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold, color: AppColors.GRAY4F),
          subtitle1: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold, color: AppColors.GRAY4F),
          subtitle2: TextStyle(fontSize: 19.0, color: AppColors.GRAY4F),
          bodyText1: TextStyle(fontSize: 15.0, color: AppColors.GRAY4F),
          bodyText2: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: AppColors.GRAY4F),
          caption: TextStyle(fontSize: 11.0, color: AppColors.GRAY4F, height: 1.1),
        ),
      );
}
