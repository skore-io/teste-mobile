import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:testemobile/data/constants/app_colors.dart';

// ignore: must_be_immutable
class ContainerNavbar extends StatelessWidget {
  Function menuPressed;
  ContainerNavbar({Key? key, required this.menuPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.yellow.withOpacity(0.8),
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                menuPressed();
              },
              child: Icon(
                Icons.menu,
                color: AppColors.yellow,
              ),
            ),
            SvgPicture.asset(
              'lib/assets/logo.svg',
              width: Get.width * 0.4,
            ),
          ],
        ),
      ),
    );
  }
}
