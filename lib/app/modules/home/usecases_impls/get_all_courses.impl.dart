import 'package:dartz/dartz.dart';
import 'package:score_cursos/app/modules/home/domain/entities/course.entity.dart';
import 'package:score_cursos/app/modules/home/domain/repositories/home.repository.dart';
import 'package:score_cursos/app/modules/home/domain/usecases/get_all_courses.usecase.dart';
import 'package:score_cursos/app/modules/home/errors/home.error.dart';

class GetAllCoursesImpl implements GetAllCourses{

  HomeRepository _homeRepository;

  GetAllCoursesImpl(this._homeRepository);

  @override
  Future<Either<HomeError, List<CourseEntity>>> call() async{
    return await _homeRepository.fetchCourses();
  }

}