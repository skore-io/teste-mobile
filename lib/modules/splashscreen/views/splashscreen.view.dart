import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:skoreio/core/styles/appassets.style.dart';
import 'package:skoreio/core/styles/appcolors.style.dart';
import 'package:skoreio/modules/splashscreen/controllers/splashscreen.controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          AppAssets.BRAND,
          width: Get.width * .7,
          color: AppColors.PRIMARY,
        ),
      ),
    );
  }
}
