
import 'routes.dart';

Widget initialPage(RouteSettings routeSettings, Controller controller) {
  Widget initialPage = const DashboardView();

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
    case DashboardView.routeName:
      return const DashboardView();
      

    default:
      return const AppUnknowView();
  }
}
