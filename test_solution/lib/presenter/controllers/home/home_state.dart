import 'package:test_solution/data/models/discipline_model.dart';

abstract class HomeState {}

class InitialHomeState extends HomeState {}

class SuccessHomeState extends HomeState {
  final List<DisciplineModel> disciplinesList;

  SuccessHomeState(this.disciplinesList);
}

class LoadingHomeState extends HomeState {}

class NoDataHomeState extends HomeState {}

class ErrorHomeState extends HomeState {
  final String message;

  ErrorHomeState(this.message);
}
