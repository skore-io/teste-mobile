import 'package:mobileteste/app/modules/home/infra/models/todo_class_model.dart';

abstract class TodoDatasource {
  Future<List<TodoClassModel>> getAllClass();
}
