import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testemobile/app/pages/home/home_controller.dart';
import 'package:testemobile/app/widgets/classrom_list.dart';
import 'package:testemobile/app/widgets/container_navbar.dart';
import 'package:testemobile/app/widgets/custom_drawer.dart';
import 'package:testemobile/app/widgets/header_title.dart';
import 'package:testemobile/data/constants/app_colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool drawerOpen = false;

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'lib/assets/background.png',
            height: Get.height,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: drawerOpen == true ? 0.8 : 1,
              curve: Curves.fastLinearToSlowEaseIn,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: AppColors.gray.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.gray.withOpacity(0.8),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ContainerNavbar(menuPressed: () {
                      setState(() {
                        drawerOpen = !drawerOpen;
                      });
                    }),
                    const HeaderTitle(),
                    ClassromList(classroms: controller.classroms)
                  ],
                ),
              ),
            ),
          ),
          CustomDrawer(
            handleOnPressed: () {
              setState(() {
                drawerOpen = !drawerOpen;
              });
            },
            customDrawerView: drawerOpen,
          )
        ],
      ),
    );
  }
}
