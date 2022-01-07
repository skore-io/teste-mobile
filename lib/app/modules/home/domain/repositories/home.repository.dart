import 'package:dartz/dartz.dart';
import 'package:score_cursos/app/modules/home/domain/entities/course.entity.dart';
import 'package:score_cursos/app/modules/home/errors/repository.error.dart';

abstract class HomeRepository{
  Future<Either<RepositoryError, List<CourseEntity>>> fetchCourses();
}