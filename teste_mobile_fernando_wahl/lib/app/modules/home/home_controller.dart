import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:teste_mobile_fernando_wahl/app/core/utils/hexcolor.dart';
import 'package:teste_mobile_fernando_wahl/app/data/classes/classes_model.dart';
import 'package:teste_mobile_fernando_wahl/app/pages/home/widgets/itens_card.dart';



class HomeController extends GetxController {

  RxBool loading = false.obs;
   bool? showDetails = false;


   @override
  void onReady() async{
    super.onReady();
    fetchAllClasses();
  }

  final listClasses = <ClasseModel>[].obs;

  Future fetchAllClasses() async {
    loading.value = true;

    String? classesJsonString = await rootBundle.loadString("assets/data/classes.json");
    List<dynamic>? classesMaps = await json.decode(classesJsonString); //jsonDecode(classesJsonString);
    listClasses.value = List<ClasseModel>.from(classesMaps!.map((x) => ClasseModel.fromJson(x)));
    loading.value = false;
  }


  void showCard(){
    showDetails = !showDetails!;
    update();
  }


  List<ClasseModel> get classeList => listClasses;
  set classeList(List<ClasseModel> model) {
    listClasses.value = model;
    update();
  } 

  deleteClass(int index) {
      Get.defaultDialog(
        title: "Atenção",
        middleText: "Deseja realmente apagar?\nNão será possível reverter!",
        textCancel: "Cancelar",
        textConfirm: "Apagar",
        buttonColor: HexColor("00CEB2"),
        confirmTextColor: HexColor("FFFFFF"),
        onConfirm: () {
          print(index);
          classeList.removeRange(index, index);
          Get.back();
        },
      );
      update();
    }

  sortListClasse(String type) {
    final list = List<ClasseModel>.from(classeList);
    switch (type) {
      case "id":
        list.sort((a, b) => a.id!.compareTo(b.id!));
        break;
      case "name":
        list.sort((a, b) => a.name!.compareTo(b.name!));
        break;
      case "status":
        list.sort((a, b) => a.status!.compareTo(b.status!));
        break;
      case "percentage":
        list.sort((a, b) => a.summary!.percentage!.compareTo(b.summary!.percentage!));
        break;
      default:
        list.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
        break;
    }

    classeList = list;
  }

  
}
