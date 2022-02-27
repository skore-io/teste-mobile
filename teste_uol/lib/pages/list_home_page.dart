import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_uol/controllers/list_home_page_controller.dart';
import 'package:teste_uol/widgets/card_to_list.dart';

class ListHomePage extends StatelessWidget {
  const ListHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[200],
          title: Text(
            'Teste UOL',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: GetBuilder(
            init: ListHomePageController(),
            builder: (ListHomePageController controller) => SizedBox(
                  height: 600,
                  child: Obx(
                    () => ListView.builder(
                        itemCount: controller.orderData.value.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CardToList(index);
                        }),
                  ),
                )));
  }
}
