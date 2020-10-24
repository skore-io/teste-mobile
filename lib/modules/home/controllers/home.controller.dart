import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skoreio/core/enums/loadingstatus.enum.dart';
import 'package:skoreio/core/models/classes.model.dart';
import 'package:skoreio/core/styles/appcolors.style.dart';
import 'package:skoreio/modules/home/stores/home.store.dart';

class HomeController {
  HomeController(this._store) {
    fetchAllClasses();
  }

  HomeStore _store;

  bool get isLoading => _store.loadingStatus.value == ELoadingStatus.loading;

  List<ClassModel> get classList => _store.listClasses;
  set classList(List<ClassModel> model) => _store.listClasses.value = model;

  fetchAllClasses() {
    _store.fetchAllClasses().then((value) => sortClassList(null));
  }

  sortClassList(String type) {
    final list = List<ClassModel>.from(classList);
    switch (type) {
      case "id":
        list.sort((a, b) => a.id.compareTo(b.id));
        break;
      case "name":
        list.sort((a, b) => a.name.compareTo(b.name));
        break;
      case "status":
        list.sort((a, b) => a.status.compareTo(b.status));
        break;
      case "percentage":
        list.sort((a, b) => a.summary.percentage.compareTo(b.summary.percentage));
        break;
      default:
        list.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        break;
    }

    classList = list;
  }

  removeClass(int index) {
    Get.defaultDialog(
      title: "Atenção",
      middleText:
          "Ao confirmar todos os dados relacionados serão apagados e não serão possível recuperá-los, você tem certeza?",
      textCancel: "Cancelar",
      textConfirm: "Sim, tenho certeza!",
      buttonColor: AppColors.DANGER,
      confirmTextColor: Colors.white,
      onConfirm: () {
        classList.removeAt(index);
        Get.back();
      },
    );
  }
}
