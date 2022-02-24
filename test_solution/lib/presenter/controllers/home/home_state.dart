import 'package:test_solution/data/models/class_model.dart';

abstract class HomeState {}

class InitialHomeState extends HomeState {}

class SuccessHomeState extends HomeState {
  final List<ClassModel> classesList;

  SuccessHomeState(this.classesList);
}

class LoadingHomeState extends HomeState {}

class ErrorHomeState extends HomeState {
  final String message;

  ErrorHomeState(this.message);
}
