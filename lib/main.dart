import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/constants.dart';
import 'core/routes/app_pages.dart';
import 'modules/list_classes_module/list_classes_binding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Setting the status bar text color to white
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light,
  );

  // Setting the avaiable orientations for the app
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    GetMaterialApp(
      locale: Locale('pt', 'BR'),
      supportedLocales: [const Locale('pt', 'BR')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      title: Constants.titleApp,
      themeMode: ThemeMode.dark,
      getPages: AppPages.routes,
      initialRoute: AppRoutes.LIST_CLASSES,
      initialBinding: ListClassesBindings(),
    ),
  );
}
