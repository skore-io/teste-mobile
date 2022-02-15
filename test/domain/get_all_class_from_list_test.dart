import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobileteste/app/modules/home/domain/errors/errors.dart';
import 'package:mocktail/mocktail.dart';

import 'package:mobileteste/app/modules/home/domain/entites/todo_class.dart';
import 'package:mobileteste/app/modules/home/domain/entites/todo_summary.dart';
import 'package:mobileteste/app/modules/home/domain/repositories/todo_repository.dart';
import 'package:mobileteste/app/modules/home/domain/usecases/get_all_class_from_list.dart';

class TodoRepositoryImpl extends Mock implements TodoRepository {}

main() {
  TodoRepository? repository;
  GetAllClassFromListImpl? usecase;
  TodoClass? resultTodo;

  setUp(() {
    repository = TodoRepositoryImpl();
    usecase = GetAllClassFromListImpl(repository!);
    resultTodo = TodoClass(
        companyId: faker.company.position(),
        createdAt: faker.date.dateTime(),
        id: '',
        name: faker.person.name(),
        status: 'IN_PROGRESS',
        summary: TodoSummary(percentage: 20));
  });

  test('Should return an List of TodoClass if usecase success', () async {
    when(() => repository!.getAllClass())
        .thenAnswer((_) async => Right(<TodoClass>[resultTodo!]));

    final result = await usecase!();

    expect(result.fold((l) => null, (r) => r), isA<List<TodoClass>>());
  });
  test('Should return an Failure GetAllClassListEmptyError if list is empty',
      () async {
    when(() => repository!.getAllClass())
        .thenAnswer((_) async => const Right([]));

    final result = await usecase!();

    expect(result.fold((l) => l, (r) => []), isA<GetAllClassListEmptyError>());
  });
}
