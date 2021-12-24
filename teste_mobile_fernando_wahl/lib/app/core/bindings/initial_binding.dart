import 'package:get/instance_manager.dart';
import 'package:teste_mobile_fernando_wahl/app/modules/home/home_controller.dart';
import 'package:teste_mobile_fernando_wahl/app/modules/splash/splash_controller.dart';


class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
