import 'package:get/instance_manager.dart';
import 'package:skoreio/modules/home/controllers/home.controller.dart';
import 'package:skoreio/modules/home/repositories/home.repository.dart';
import 'package:skoreio/modules/home/stores/home.store.dart';
import 'package:skoreio/modules/splashscreen/controllers/splashscreen.controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(() => SplashscreenController());

    //DI Home
    Get.lazyPut<HomeController>(() {
      Get.put(HomeRepository());
      Get.put(HomeStore(Get.find()));
      return HomeController(Get.find());
    });
  }
}
