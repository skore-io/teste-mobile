import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rive/rive.dart';
import 'package:get/get.dart';

import '../../app_routes.dart';

class SplashController extends GetxController {
  final storage = GetStorage();

  Artboard? artboard;

  loadRiveFile() async {
    final bytes = await rootBundle.load(
      'lib/assets/loading.riv',
    );
    final file = RiveFile.import(bytes);
    artboard = file.mainArtboard;
    artboard!.addController(SimpleAnimation(
      'loading',
    ));
    Get.forceAppUpdate(); //Foi mal pela gambiarra ~~
  }

  simulateLoading() {
    Future.delayed(const Duration(seconds: 3), () {
      checkFirstAccess() ? Get.offNamed(AppRoutes.onboarding) : Get.offNamed(AppRoutes.home);
    });
  }

  checkFirstAccess() {
    final value = storage.read('firstAccess');
    if (value == null || value == true) {
      storage.write('firstAccess', false);
      return true;
    } else {
      return false;
    }
  }

  @override
  void onInit() {
    loadRiveFile();
    simulateLoading();
    super.onInit();
  }
}
