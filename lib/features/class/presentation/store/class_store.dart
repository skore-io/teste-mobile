import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:minhas_aulas/core/usecases/usecase.dart';
import 'package:minhas_aulas/features/class/domain/entities/class.dart';
import 'package:minhas_aulas/features/class/domain/usecases/get_classes.dart';
import 'package:mobx/mobx.dart';

part 'class_store.g.dart';

enum ClassStoreState { initial, loading, deleting, loaded, error }

class ClassStore = _ClassStore with _$ClassStore;

abstract class _ClassStore with Store {
  _ClassStore({@required this.getClasses}) : assert(getClasses != null);

  final GetClasses getClasses;

  @observable
  ObservableList<Class> _classes = ObservableList();

  @observable
  ClassStoreState state = ClassStoreState.initial;

  @observable
  String errorMessage;

  @observable
  ObservableList<Class> classes = ObservableList();

  String formatDate(int date) {
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(DateTime.fromMillisecondsSinceEpoch(date));
  }

  @action
  Future<void> initClasses() async {
    state = ClassStoreState.loading;
    await _fetchClasses();
    sortByOldest();
    state = ClassStoreState.loaded;
  }

  @action
  Future<void> deleteClass(String id) async {
    state = ClassStoreState.deleting;
    await Future.delayed(Duration(milliseconds: 1000));
    classes.removeWhere((element) => element.id == id);
    state = ClassStoreState.loaded;
  }

  @action
  void searchClass(String value) {
    print('finding');
    if (value.isNotEmpty) {
      print('here before $classes');
      final a = _classes;
      classes = a.where((element) => element.name.contains(value));
      print('here after $classes');
    } else {
      print('pega $_classes');
      classes = _classes;
    }
  }

  @action
  void sortByCompleted() {
    _classes
        .sort((a, b) => b.summary.percentage.compareTo(a.summary.percentage));
  }

  @action
  void sortByOldest() {
    _classes.sort((a, b) => a.createdAt.compareTo(b.createdAt));
  }

  @action
  void sortBynewest() {
    _classes.sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  Future<void> _fetchClasses() async {
    final either = await getClasses(NoParams());
    either.fold((failure) {
      errorMessage = 'Erro ao listar as aulas';
      state = ClassStoreState.error;
    }, (classesData) {
      _classes.addAll(classesData);
      classes = _classes;
    });
  }
}
