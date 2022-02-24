import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:test_solution/core/errors/failures.dart';
import 'package:test_solution/data/datasources/local/classes_local_datasource.dart';
import 'package:test_solution/data/models/class_model.dart';

class ClassesLocalRepository {
  final ClassesLocalDatasource datasource;

  ClassesLocalRepository(this.datasource);

  Future<Either<Failure, List<ClassModel>>> fetchClasses() async {
    try {
      final result = await datasource.fetchClasses();
      return Right(result);
    } catch (e) {
      return Left(InternalFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, void>> deleteClass() {
    throw UnimplementedError();
  }
}
