import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skoreio/core/routes/pages.routes.dart';
import 'package:skoreio/core/styles/apptheme.style.dart';

import 'bindings/initial.binding.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Skore Classes',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      getPages: PagesRoutes.routes,
      initialRoute: PagesRoutes.INITIAL,
      initialBinding: InitialBinding(),
    );
  }
}
