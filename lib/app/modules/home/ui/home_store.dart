import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:score_cursos/app/common/entities/user.entity.dart';
import 'package:score_cursos/app/modules/home/domain/entities/course.entity.dart';
import 'package:score_cursos/app/modules/home/domain/usecases/get_all_courses.usecase.dart';
import 'package:score_cursos/app/modules/home/errors/home.error.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {

  UserEntity? loggedUser;
  final GetAllCourses _getAllCoursesUseCase;

  HomeStoreBase(this._getAllCoursesUseCase);

  @observable
  ObservableList<CourseEntity> myCourses = ObservableList<CourseEntity>();

  @observable
  bool loadingCourses = false;

  @action
  void setLoadingCourses(bool value)=>loadingCourses=value;

  @action
  void addCourses(CourseEntity course)=>myCourses.add(course);

  @action
  void removeCourse(CourseEntity course)=>myCourses.remove(course);

  int get completeds => myCourses.where((c) => c.status==Status.COMPLETED).length;
  
  void initialize(UserEntity? userEntity){
    loggedUser = userEntity;
    if(loggedUser!=null){
      loadCoursesFromUser();
    }
  }

  Future loadCoursesFromUser()async{
    setLoadingCourses(true);
    Either<HomeError, List<CourseEntity>> request = await _getAllCoursesUseCase();
    request.fold((HomeError e) {
      // TODO IMPLEMENTE SHOW ERROR
    }, (List<CourseEntity> courses) {
      courses.map((c) => addCourses(c)).toList();
      myCourses.sort((a,b)=>DateTime.fromMicrosecondsSinceEpoch(b.createdAt!).compareTo(DateTime.fromMicrosecondsSinceEpoch(a.createdAt!)));
    });
    setLoadingCourses(false);
  }

}