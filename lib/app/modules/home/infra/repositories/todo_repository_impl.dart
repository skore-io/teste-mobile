import 'package:dartz/dartz.dart';

import 'package:mobileteste/app/core/errors/errors.dart';
import 'package:mobileteste/app/modules/home/domain/entites/todo_class.dart';
import 'package:mobileteste/app/modules/home/domain/errors/errors.dart';
import 'package:mobileteste/app/modules/home/domain/repositories/todo_repository.dart';
import 'package:mobileteste/app/modules/home/infra/datasources/todo_datasource.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDatasource datasource;

  TodoRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<TodoClass>>> getAllClass() async {
    try {
      final response = await datasource.getAllClass();
      return Right(response);
    } catch (e) {
      return Left(GetAllClassFromListError(message: 'Erro in get class list'));
    }
  }
}
