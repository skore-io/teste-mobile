import 'package:dartz/dartz.dart';
import 'package:score_cursos/app/modules/home/domain/entities/course.entity.dart';
import 'package:score_cursos/app/modules/home/errors/home.error.dart';

abstract class GetAllCourses{
  Future<Either<HomeError, List<CourseEntity>>> call();
}