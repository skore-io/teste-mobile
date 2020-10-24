class SplashscreenController {
  SplashscreenController() {
    changeRoute();
  }

  changeRoute() {
    Future.delayed(const Duration(seconds: 3), () {
      // Get.offAndToNamed(AppRoutes.SPLASHSCREEN);
    });
  }
}
