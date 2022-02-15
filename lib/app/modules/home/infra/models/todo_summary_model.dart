import 'dart:convert';

import 'package:mobileteste/app/modules/home/domain/entites/todo_summary.dart';

class TodoSummaryModel extends TodoSummary {
  TodoSummaryModel({required percentage}) : super(percentage: percentage);

  Map<String, dynamic> toMap() {
    return {
      'percentage': percentage,
    };
  }

  factory TodoSummaryModel.fromMap(Map<String, dynamic> map) {
    return TodoSummaryModel(percentage: map['percentage'] ?? 0);
  }

  String toJson() => json.encode(toMap());

  factory TodoSummaryModel.fromJson(String source) =>
      TodoSummaryModel.fromMap(json.decode(source));
}
