import 'package:get/get.dart';
import 'package:teste_mobile_fernando_wahl/app/routes/app_routes.dart';

class SplashController extends GetxController{

    @override
  void onReady() async{
    super.onReady();
    loading();
  }

  Future<void> loading() async {

    Future.delayed(const Duration(seconds: 2), () {
      //aqui poderia fazer uma possível verificação do token
      Get.offAndToNamed(AppRoutes.HOME);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

}
