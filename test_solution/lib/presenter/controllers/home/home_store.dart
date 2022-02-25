import 'package:flutter/material.dart';
import 'package:test_solution/data/models/discipline_model.dart';
import 'package:test_solution/data/repositories/local/disciplines_local_repository.dart';
import 'home_state.dart';

class HomeStore extends ValueNotifier<HomeState> {
  final DisciplinesLocalRepository _repository;
  HomeStore(this._repository) : super(InitialHomeState());

  var _isAscendingSort = false;

  Future<void> fetchDisciplines() async {
    value = LoadingHomeState();
    final result = await _repository.fetchDisciplines();
    result.fold((e) {
      final message = e.toString();
      value = ErrorHomeState(message);
    }, (success) {
      if (success.isEmpty) {
        value = NoDataHomeState();
      } else {
        value = SuccessHomeState(success);
        _sortList();
      }
    });
  }

  Future<void> deleteDiscipline(DisciplineModel disciplineModel) async {
    value = LoadingHomeState();
    final result = await _repository.deleteDiscipline(disciplineModel);
    result.fold((e) {
      final message = e.toString();
      value = ErrorHomeState(message);
    }, (_) async {
      fetchDisciplines();
    });
  }

  void changeSortType() {
    _isAscendingSort = !_isAscendingSort;
    _sortList();
  }

  void _sortList() {
    final currentState = value;
    if (currentState is! SuccessHomeState) {
      return;
    }

    final disciplinesList = currentState.disciplinesList;

    if (_isAscendingSort) {
      disciplinesList.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    } else {
      disciplinesList.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    }
    value = SuccessHomeState(disciplinesList);
  }
}
