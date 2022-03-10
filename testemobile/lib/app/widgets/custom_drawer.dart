import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testemobile/data/constants/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class CustomDrawer extends StatelessWidget {
  Function handleOnPressed;
  bool customDrawerView;
  CustomDrawer({Key? key, required this.handleOnPressed, required this.customDrawerView}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedSlide(
        duration: const Duration(milliseconds: 500),
        offset: Offset.fromDirection(0, customDrawerView == false ? -1.5 : 0),
        curve: Curves.fastOutSlowIn,
        child: GestureDetector(
          onHorizontalDragEnd: (DragEndDetails details) {
            if (details.primaryVelocity! < 0) {
              handleOnPressed();
            }
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            height: Get.height,
            decoration: BoxDecoration(
              color: AppColors.yellow,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: AppColors.yellow.withOpacity(0.8),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Center(
              child: MaterialButton(
                color: AppColors.gray,
                shape: const StadiumBorder(),
                onPressed: () {
                  launch('https://www.linkedin.com/in/layson-eduardo/');
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Contratar',
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: AppColors.yellow),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
