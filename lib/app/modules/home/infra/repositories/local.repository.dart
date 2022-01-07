import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:score_cursos/app/modules/home/domain/entities/course.entity.dart';
import 'package:score_cursos/app/modules/home/domain/repositories/home.repository.dart';
import 'package:score_cursos/app/modules/home/errors/repository.error.dart';
import 'package:score_cursos/app/modules/home/infra/models/course.model.dart';

class LocalRepository implements HomeRepository{
  @override
  Future<Either<RepositoryError, List<CourseEntity>>> fetchCourses() async{
    await Future.delayed(const Duration(seconds: 2));
    try{
      String data = await rootBundle.loadString('assets/jsons/courses.json');
      var jsonResult = json.decode(data);
      List<Course> c = (jsonResult as List).map((e) => Course.fromJson(e)).toList();
      return Right(c);
    }catch(e){
      return Left(RepositoryError(message: "Não foi possível carregar os cursos"));
    }
  }
}