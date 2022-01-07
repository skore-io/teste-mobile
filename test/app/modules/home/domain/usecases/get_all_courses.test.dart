import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:score_cursos/app/modules/home/domain/entities/course.entity.dart';
import 'package:score_cursos/app/modules/home/domain/repositories/home.repository.dart';
import 'package:score_cursos/app/modules/home/domain/usecases/get_all_courses.usecase.dart';
import 'package:score_cursos/app/modules/home/errors/repository.error.dart';
import 'package:score_cursos/app/modules/home/infra/models/course.model.dart';
import 'package:score_cursos/app/modules/home/usecases_impls/get_all_courses.impl.dart';
import 'package:mocktail/mocktail.dart';

class HomeRepositoryMock extends Mock implements HomeRepository{}
main(){

  late HomeRepository _homeRepository;
  late GetAllCourses _usecase;

  setUp((){
    _homeRepository = HomeRepositoryMock();
    _usecase = GetAllCoursesImpl(_homeRepository);
  });

  group('test usecase', (){
    test('should get consult list of courses', ()async{
      // Arrange
      when(()=>_homeRepository.fetchCourses()).thenAnswer((_) async => const Right(<Course>[]));

      //Act
      final result = await _usecase();

      //Assert
      expect(result.fold(id, id), isA<List<Course>>());
      verify(_homeRepository.fetchCourses).called(1);
      verifyNoMoreInteractions(_homeRepository);
    });

    test('should get repositoryError', ()async{
      // Arrange
      when(()=>_homeRepository.fetchCourses()).thenAnswer((_)async=> Left(RepositoryError(message: 'error')));

      //Act
      final result = await _usecase();

      //Assert
      expect(result.fold(id, id), isA<RepositoryError>());
      verify(_homeRepository.fetchCourses).called(1);
      verifyNoMoreInteractions(_homeRepository);
    });
  });

}