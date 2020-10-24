import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:skoreio/core/styles/appassets.style.dart';
import 'package:skoreio/core/styles/appcolors.style.dart';
import 'package:skoreio/core/styles/appstyles.style.dart';
import 'package:skoreio/modules/splashscreen/controllers/splashscreen.controller.dart';

class SplashscreenView extends StatefulWidget {
  const SplashscreenView({Key key}) : super(key: key);

  @override
  _SplashscreenViewState createState() => _SplashscreenViewState();
}

class _SplashscreenViewState extends State<SplashscreenView> {
  SplashscreenController controller = Get.put(SplashscreenController());

  @override
  void initState() {
    super.initState();
    controller.changeRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              AppAssets.BRAND,
              width: Get.width * .7,
              color: AppColors.PRIMARY,
            ),
            Container(height: 10),
            Text("The ultimate stack for digital learning.", style: AppStyles.body1),
          ],
        ),
      ),
    );
  }
}
