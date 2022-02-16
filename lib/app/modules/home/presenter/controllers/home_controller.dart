import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;

import 'package:mobileteste/app/modules/home/domain/usecases/get_all_class_from_list.dart';
import 'package:mobileteste/app/modules/home/infra/models/todo_class_model.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GetAllClassFromList getAllClassFromList;

  _HomeControllerBase(this.getAllClassFromList) {
    getList();
  }

  @observable
  var todoClass = <TodoClassModel>[].asObservable();

  @action
  Future<void> getList() async {
    final response = await getAllClassFromList();
    response.fold(
        (failure) =>
            asuka.showSnackBar(SnackBar(content: Text(failure.message!))),
        (result) {
      result.sort((a, b) {
        return a.createdAt.compareTo(b.createdAt);
      });
      todoClass = (result as List<TodoClassModel>).asObservable();
    });
  }

  @action
  removeItemList(int index) {
    todoClass.removeAt(index);
  }
}
