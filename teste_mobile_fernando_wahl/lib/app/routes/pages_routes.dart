import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:teste_mobile_fernando_wahl/app/modules/home/home_bindings.dart';
import 'package:teste_mobile_fernando_wahl/app/modules/splash/splah_bindings.dart';
import 'package:teste_mobile_fernando_wahl/app/pages/home/home.dart';
import 'package:teste_mobile_fernando_wahl/app/pages/splash/splash.dart';
import 'app_routes.dart';

class PagesRoutes {
  static const INITIAL = AppRoutes.SPLASH;

  static final routes = [

    GetPage(name: AppRoutes.SPLASH, page: () => Splash(), binding: SplashBinding()),
    GetPage(name: AppRoutes.HOME, page: () => Home(), binding: HomeBinding()),
  ];
}
