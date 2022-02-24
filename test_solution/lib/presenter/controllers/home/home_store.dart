import 'package:flutter/material.dart';
import 'package:test_solution/data/models/discipline_model.dart';
import 'package:test_solution/data/repositories/local/disciplines_local_repository.dart';
import 'home_state.dart';

class HomeStore extends ValueNotifier<HomeState> {
  final DisciplinesLocalRepository repository;
  HomeStore(this.repository) : super(InitialHomeState());

  var disciplinesList = <DisciplineModel>[];
  var isAscendingSort = false;

  Future<void> fetchDisciplines() async {
    value = LoadingHomeState();
    final result = await repository.fetchDisciplines();
    result.fold((e) {
      final message = e.toString();
      value = ErrorHomeState(message);
    }, (success) {
      if (success.isEmpty) {
        value = NoDataHomeState();
      } else {
        disciplinesList = success;
        sortList();
        value = SuccessHomeState(success);
      }
    });
  }

  Future<void> deleteDiscipline(DisciplineModel classModel) async {
    value = LoadingHomeState();
    final result = await repository.deleteDiscipline(classModel);
    result.fold((e) {
      final message = e.toString();
      value = ErrorHomeState(message);
    }, (_) async {
      fetchDisciplines();
    });
  }

  void changeSortType() {
    value = LoadingHomeState();
    isAscendingSort = !isAscendingSort;
    sortList();
    value = SuccessHomeState(disciplinesList);
  }

  void sortList() {
    if (isAscendingSort) {
      disciplinesList.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    } else {
      disciplinesList.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    }
  }
}
