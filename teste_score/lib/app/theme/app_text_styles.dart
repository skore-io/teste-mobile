import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme.dart';

abstract class AppTextStyles {
  TextStyle get titleAppBar;
  TextStyle get titleSplash;
}

class AppTextStylesDefault implements AppTextStyles {
  @override
  TextStyle get titleAppBar => GoogleFonts.inter(
      fontSize: 20,
      color: AppTheme.colors.titleAppBar,
      fontWeight: FontWeight.w700);

  @override
  TextStyle get titleSplash => GoogleFonts.montserrat(
      fontSize: 30,
      color: AppTheme.colors.primary,
      fontWeight: FontWeight.w700);
}
