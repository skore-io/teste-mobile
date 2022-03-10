import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:testemobile/domain/entities/classrom_entity.dart';

class HomeController extends GetxController {
  RxList classroms = [].obs;

  simulateApiRequest() async {
    await Future.delayed(const Duration(seconds: 2), () async {
      final String response = await rootBundle.loadString('lib/data/repositories/data.json');
      List data = await json.decode(response);
      for (var item in data) {
        ClassRomEntity classrom = ClassRomEntity.fromJson(item);
        classroms.add(classrom);
      }

      classroms.sort((a, b) {
        return a.createdAt.compareTo(b.createdAt);
      });
      Get.forceAppUpdate();
    });
  }

  @override
  void onInit() {
    simulateApiRequest();
    super.onInit();
  }
}
