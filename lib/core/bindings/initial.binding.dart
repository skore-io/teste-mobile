import 'package:get/instance_manager.dart';
import 'package:skoreio/modules/splashscreen/controllers/splashscreen.controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(() => SplashscreenController());
  }
}
