import 'package:get/get.dart';
import 'package:skoreio/core/routes/app.routes.dart';

class SplashscreenController {
  changeRoute() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAndToNamed(AppRoutes.HOME);
    });
  }
}
