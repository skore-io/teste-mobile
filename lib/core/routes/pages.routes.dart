import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:skoreio/modules/splashscreen/views/splashscreen.view.dart';

import 'app.routes.dart';

class PagesRoutes {
  static const INITIAL = AppRoutes.SPLASHSCREEN;

  static final routes = [
    GetPage(name: AppRoutes.SPLASHSCREEN, page: () => SplashscreenView()),
  ];
}
