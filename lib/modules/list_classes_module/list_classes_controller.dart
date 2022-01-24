import 'dart:developer';

import 'package:get/get.dart';

import '../../domain/models/class_model.dart';
import '../../domain/usecases/list_classes_usecase/list_classes_usecase.dart';
import '../base_controller.dart';

class ListClassesController extends BaseController {
  static ListClassesController get find => Get.find<ListClassesController>();

  bool _isLoading = false;
  List<ClassModel> allClasses = [];

  @override
  bool get isLoading => _isLoading;

  final IListClassesUsecase _listClassesUsecase;

  ListClassesController(this._listClassesUsecase);

  @override
  void onInit() {
    super.onInit();
    getClassesList();
  }

  void getClassesList() async {
    _isLoading = true;
    update();

    try {
      List<ClassModel>? list = await _listClassesUsecase();

      if (list != null) {
        allClasses.addAll(list);
      }
    } catch (e) {
      log(e.toString());
    } finally {
      _isLoading = false;
      update();
    }
  }

  void refreshList() {
    allClasses.clear();
    getClassesList();
  }

  void deleteClass(String classId) {
    _isLoading = true;
    update();

    try {
      allClasses.removeWhere((oneClass) => oneClass.id == classId);
    } catch (e) {
      log(e.toString());
    } finally {
      _isLoading = false;
      update();
    }
  }
}
