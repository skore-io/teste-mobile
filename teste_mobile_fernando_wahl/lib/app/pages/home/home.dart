import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:teste_mobile_fernando_wahl/app/modules/home/home_controller.dart';
import 'package:teste_mobile_fernando_wahl/app/pages/home/widgets/appbar.dart';
import 'package:teste_mobile_fernando_wahl/app/pages/home/widgets/classitem.dart';



class Home extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
      appBar: HomeAppBar(
        onPressed: () {
          controller.fetchAllClasses();
        },
      ),
      body: Obx(() => controller.loading.value == true
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: controller.listClasses.length,
              itemBuilder: (_, index) => ClassItemWidget(
                classe: controller.listClasses[index],
                onDelete: () => controller.deleteClass(index),
              ),
            )),
    );
    });
    
  }
}
