import 'package:flutter/material.dart';

import 'appcolors.style.dart';

class AppTheme {
  static get themeData => ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: AppColors.PRIMARY,
        accentColor: AppColors.GRAY4F,
        visualDensity: VisualDensity.adaptivePlatformDensity,

        //Define the default appbar theme
        appBarTheme: AppBarTheme(shadowColor: AppColors.SHADOW),

        scaffoldBackgroundColor: Colors.white,
      );
}
