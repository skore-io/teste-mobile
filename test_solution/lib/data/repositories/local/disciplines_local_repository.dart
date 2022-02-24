import 'package:dartz/dartz.dart';
import 'package:test_solution/core/errors/failures.dart';
import 'package:test_solution/data/datasources/local/disciplines_local_datasource.dart';
import 'package:test_solution/data/models/discipline_model.dart';

class DisciplinesLocalRepository {
  final DisciplinesLocalDatasource datasource;

  DisciplinesLocalRepository(this.datasource);

  Future<Either<Failure, List<DisciplineModel>>> fetchDisciplines() async {
    try {
      final result = await datasource.fetchDisciplines();
      return Right(result);
    } catch (e) {
      return Left(InternalFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, void>> deleteDiscipline(
      DisciplineModel classModel) async {
    try {
      final result = await datasource.deleteDiscipline(classModel);
      return Right(result);
    } catch (e) {
      return Left(InternalFailure(message: e.toString()));
    }
  }
}
