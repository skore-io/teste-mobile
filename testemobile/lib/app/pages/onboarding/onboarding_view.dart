import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:testemobile/app/pages/onboarding/onboarding_controller.dart';
import 'package:testemobile/app/widgets/simple_button.dart';
import 'package:testemobile/data/constants/app_colors.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    final OnboardingController controller = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'lib/assets/background.png',
            height: Get.height,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SvgPicture.asset(
                    'lib/assets/logo.svg',
                    width: Get.width * 0.5,
                  ),
                ),
                CarouselSlider(
                  items: controller.carouselItems,
                  options: CarouselOptions(
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    autoPlayCurve: Curves.decelerate,
                    enableInfiniteScroll: true,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    autoPlayInterval: const Duration(seconds: 5),
                    height: Get.height * 0.7 + 20,
                    viewportFraction: 1,
                  ),
                ),
                SimpleButton(
                  title: 'Iniciar',
                  color: AppColors.gray,
                  onPressed: () {
                    controller.startButton();
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
