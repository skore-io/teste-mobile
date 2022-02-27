import 'package:get/get.dart';
import 'package:teste_uol/controllers/list_home_page_controller.dart';

class ListHomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListHomePageController>(() => ListHomePageController());
  }
}
