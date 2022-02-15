import 'package:dartz/dartz.dart';
import 'package:mobileteste/app/core/errors/errors.dart';

import 'package:mobileteste/app/modules/home/domain/entites/todo_class.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<TodoClass>>> getAllClass();
}
