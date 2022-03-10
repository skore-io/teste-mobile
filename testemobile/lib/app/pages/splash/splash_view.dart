import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:testemobile/app/pages/splash/splash_controller.dart';
import 'package:testemobile/data/constants/app_colors.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SplashController controller = Get.put(SplashController());
    return Scaffold(
      backgroundColor: AppColors.gray,
      body: Stack(
        children: [
          controller.artboard == null
              ? Container()
              : Align(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 250),
                    child: Rive(
                      artboard: controller.artboard!,
                      antialiasing: true,
                    ),
                  ),
                ),
          Align(
            child: Image.asset(
              'lib/assets/logo_simple.png',
              height: 100,
            ),
          ),
        ],
      ),
    );
  }
}
