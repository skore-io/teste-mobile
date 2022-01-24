import 'package:get/route_manager.dart';

// Screens
import '../../modules/list_classes_module/list_classes_screen.dart';

// Bindings
import '../../modules/list_classes_module/list_classes_binding.dart';

part 'app_routes.dart';

class AppPages {
  static final List<GetPage<dynamic>>? routes = [
    GetPage(
      name: AppRoutes.LIST_CLASSES,
      page: () => ListClassesScreen(),
      binding: ListClassesBindings(),
    ),
  ];
}
