import 'dart:convert';

import 'package:mobileteste/app/core/utils/constants/mock_response_api.dart';
import 'package:mobileteste/app/modules/home/infra/datasources/todo_datasource.dart';
import 'package:mobileteste/app/modules/home/infra/models/todo_class_model.dart';

class LocaleDataSourceImplementation implements TodoDatasource {
  final MockResponseApi mockResponseApi;

  LocaleDataSourceImplementation(this.mockResponseApi);

  @override
  Future<List<TodoClassModel>> getAllClass() async {
    List listMock =
        jsonDecode(mockResponseApi.mock).map((e) => json.encode(e)).toList();
    final response = listMock.map((e) => TodoClassModel.fromJson(e)).toList();
    return response;
  }
}
