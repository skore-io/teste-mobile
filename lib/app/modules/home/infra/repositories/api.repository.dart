import 'package:dartz/dartz.dart';
import 'package:score_cursos/app/modules/home/domain/entities/course.entity.dart';
import 'package:score_cursos/app/modules/home/domain/repositories/home.repository.dart';
import 'package:score_cursos/app/modules/home/errors/repository.error.dart';

class ApiRepository implements HomeRepository{
  @override
  Future<Either<RepositoryError, List<CourseEntity>>> fetchCourses() {
    // TODO: BASTA IMPLEMENTAR A REQUISIÇÃO DA API
    throw UnimplementedError();
  }
}