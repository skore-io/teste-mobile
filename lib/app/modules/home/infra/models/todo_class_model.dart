import 'dart:convert';

import 'package:mobileteste/app/core/utils/functions/functions.dart';
import 'package:mobileteste/app/modules/home/domain/entites/todo_class.dart';
import 'package:mobileteste/app/modules/home/infra/models/todo_summary_model.dart';

class TodoClassModel extends TodoClass {
  TodoClassModel(
      {required companyId,
      required DateTime createdAt,
      required name,
      required id,
      required status,
      required summary})
      : super(
            companyId: companyId,
            createdAt: createdAt,
            id: id,
            name: name,
            status: status,
            summary: summary);

  Map<String, dynamic> toMap() {
    return {
      'company_id': companyId,
      'created_at': createdAt,
      'name': name,
      'id': id,
      'status': status,
      'summary': summary
    };
  }

  factory TodoClassModel.fromMap(Map<String, dynamic> map) {
    return TodoClassModel(
        companyId: map['company_id'],
        createdAt:
            Functions().convertDateTimeInFormatterDate(map['created_at']),
        name: map['name'],
        id: map['id'],
        status: map['status'],
        summary: TodoSummaryModel.fromMap(map['summary']));
  }

  String toJson() => json.encode(toMap());

  factory TodoClassModel.fromJson(String source) =>
      TodoClassModel.fromMap(json.decode(source));
}
