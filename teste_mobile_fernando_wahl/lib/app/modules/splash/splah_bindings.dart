import 'package:get/get.dart';
import 'package:teste_mobile_fernando_wahl/app/modules/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}