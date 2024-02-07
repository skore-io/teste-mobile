
import 'package:teste_mobile/presenter/splash_screen/ui/splash_screen.dart';

import 'routes.dart';

Widget initialPage(RouteSettings routeSettings, Controller controller) {
  Widget initialPage = const SplashScreen();

  return initialPage;
}

Route<dynamic> routes(RouteSettings routeSettings, Controller controller) {
  Widget page = getPage(routeSettings, controller);
  switch (routeSettings.name) {
    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) {
            return page;
          });
  }
}

Widget getPage(RouteSettings routeSettings, Controller controller) {
  switch (routeSettings.name) {
    case '/':
      return initialPage(routeSettings, controller);
      case SplashScreen.routeName:
      return const SplashScreen();
    case DashboardView.routeName:
      return const DashboardView();
      

    default:
      return const AppUnknowView();
  }
}
