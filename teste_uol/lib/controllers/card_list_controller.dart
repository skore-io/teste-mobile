import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_uol/controllers/list_home_page_controller.dart';
import 'package:teste_uol/models/list_home_page_model.dart';

class CardListController extends GetxController {
  String? name;
  int? dataCreation;
  String? id;
  bool? completed;
  int? loading;
  ListHomePageController orderList = Get.find();
  List<ListHomePageModel> card = [];
  List<Summary> summary = [];
  List decodedList = [];
  List summaryList = [];

  @override
  Future<void> onInit() async {
    decodeOrderList();
    super.onInit();
  }

  decodeOrderList() {
    for (var element in orderList.orderData) {
      card.add(ListHomePageModel.fromJson(element));
      decodedList.add(card);
    }
    print('DECODEDDATAS===>$decodedList');
  }

  delete(index) {
    orderList.orderData.removeAt(index);
  }

  Widget? check(index) {
    if (card[index].status == 'COMPLETED') {
      return const Icon(
        Icons.check,
        color: Colors.green,
      );
    } else if (card[index].status == 'NOT_STARTED') {
      return const Text('Aguardando..');
    } else {
      return Text('${card[index].summary!.percentage.toString()}%');
    }
  }
}
