import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:skoreio/modules/home/controllers/home.controller.dart';
import 'package:skoreio/modules/home/widgets/appbar.widget.dart';
import 'package:skoreio/modules/home/widgets/classitem.widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        onRefreshPressed: () {
          controller.fetchAllClasses();
        },
      ),
      body: Obx(() => controller.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: EdgeInsets.all(20),
              itemCount: controller.classList.length,
              itemBuilder: (_, index) => ClassItemWidget(
                classe: controller.classList[index],
                onDelete: () => controller.removeClass(index),
              ),
              separatorBuilder: (_, __) => Divider(),
            )),
    );
  }
}
