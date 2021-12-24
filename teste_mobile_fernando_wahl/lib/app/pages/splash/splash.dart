import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:teste_mobile_fernando_wahl/app/modules/splash/splash_controller.dart';


class Splash extends GetView<SplashController> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/skore.png"),
          ],
        ),
      ),
    );
  }
}
