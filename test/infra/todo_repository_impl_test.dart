import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobileteste/app/modules/home/domain/errors/errors.dart';
import 'package:mobileteste/app/modules/home/infra/models/todo_class_model.dart';
import 'package:mobileteste/app/modules/home/infra/models/todo_summary_model.dart';
import 'package:mocktail/mocktail.dart';

import 'package:mobileteste/app/modules/home/infra/repositories/todo_repository_impl.dart';
import 'package:mobileteste/app/modules/home/infra/datasources/todo_datasource.dart';

class TodoDatasourceImpl extends Mock implements TodoDatasource {}

void main() {
  TodoDatasource? datasource;
  TodoRepositoryImpl? repository;
  TodoClassModel? resultTodo;

  setUp(() {
    datasource = TodoDatasourceImpl();
    repository = TodoRepositoryImpl(datasource!);
    resultTodo = TodoClassModel(
        companyId: '',
        createdAt: faker.date.dateTime(),
        name: '',
        id: '',
        status: '',
        summary: TodoSummaryModel(percentage: 20));
  });

  test('Should an List of TodoClassModel if repository return success',
      () async {
    when(() => datasource!.getAllClass())
        .thenAnswer((_) async => <TodoClassModel>[resultTodo!]);

    final response = await repository!.getAllClass();

    expect(response.fold((l) => null, (r) => r), isA<List<TodoClassModel>>());
  });

  test('Should return an GetAllClassFromListError if repository return error',
      () async {
    when(() => datasource!.getAllClass())
        .thenThrow((_) async => GetAllClassFromListError());

    final response = await repository!.getAllClass();

    expect(
        response.fold((l) => l, (r) => null), isA<GetAllClassFromListError>());
  });
}
