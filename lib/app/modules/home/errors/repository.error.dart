import 'package:score_cursos/app/modules/home/errors/home.error.dart';

class RepositoryError extends HomeError{
  String? message;

  RepositoryError({this.message});
}