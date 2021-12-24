import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/core/theme/theme.dart';
import 'app/core/translations/app_translations.dart';
import 'app/routes/pages_routes.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Skore Classes',
      debugShowCheckedModeBanner: false,
      getPages: PagesRoutes.routes,
      initialRoute: PagesRoutes.INITIAL,
      theme: AppTheme.themeData,
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
    );
  }
}