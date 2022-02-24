import 'package:flutter/material.dart';
import 'package:test_solution/data/repositories/local/classes_local_repository.dart';
import 'home_state.dart';

class HomeStore extends ValueNotifier<HomeState> {
  final ClassesLocalRepository repository;
  HomeStore(this.repository) : super(InitialHomeState());

  Future<void> fetchClasses() async {
    value = LoadingHomeState();
    final result = await repository.fetchClasses();
    result.fold((e) {
      //debugPrint('error');
      final message = e.toString();
      value = ErrorHomeState(message);
    }, (success) {
      //debugPrint('${success.length}');
      value = SuccessHomeState(success);
    });
  }
}
