import 'package:dartz/dartz.dart';
import 'package:test_solution/core/errors/failures.dart';
import 'package:test_solution/data/datasources/local/disciplines_local_datasource.dart';
import 'package:test_solution/data/models/discipline_model.dart';

class DisciplinesLocalRepository {
  final DisciplinesLocalDatasource _datasource;

  DisciplinesLocalRepository(this._datasource);

  Future<Either<Failure, List<DisciplineModel>>> fetchDisciplines() async {
    try {
      final result = await _datasource.fetchDisciplines();
      return Right(result);
    } catch (e) {
      return Left(InternalFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, void>> deleteDiscipline(
      DisciplineModel disciplineModel) async {
    try {
      final result = await _datasource.deleteDiscipline(disciplineModel);
      return Right(result);
    } catch (e) {
      return Left(InternalFailure(message: e.toString()));
    }
  }
}
