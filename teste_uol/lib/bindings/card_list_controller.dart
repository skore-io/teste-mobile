import 'package:get/get.dart';
import 'package:teste_uol/controllers/card_list_controller.dart';

class CardListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CardListController>(() => CardListController());
  }
}
