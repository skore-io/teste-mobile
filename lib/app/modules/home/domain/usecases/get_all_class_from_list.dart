import 'package:dartz/dartz.dart';

import 'package:mobileteste/app/core/errors/errors.dart';
import 'package:mobileteste/app/modules/home/domain/entites/todo_class.dart';
import 'package:mobileteste/app/modules/home/domain/errors/errors.dart';
import 'package:mobileteste/app/modules/home/domain/repositories/todo_repository.dart';

abstract class GetAllClassFromList {
  Future<Either<Failure, List<TodoClass>>> call();
}

class GetAllClassFromListImpl implements GetAllClassFromList {
  final TodoRepository repository;

  GetAllClassFromListImpl(this.repository);

  @override
  Future<Either<Failure, List<TodoClass>>> call() async {
    final result = await repository.getAllClass();

    return result.fold((l) => left(l),
        (r) => r.isNotEmpty ? right(r) : left(GetAllClassListEmptyError()));
  }
}
