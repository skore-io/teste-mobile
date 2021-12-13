import 'dart:convert';

import 'package:skore/core/helpers/date_helper.dart';
import 'package:skore/data/serializers/summary_serializer.dart';
import 'package:skore/domain/enums/lesson_status.dart';
import 'package:skore/domain/models/lesson_model.dart';
import 'package:skore/domain/models/summary_model.dart';

class LessonSerializer {
  LessonModel lessonModel;

  LessonSerializer.of({
    required this.lessonModel,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': lessonModel.id,
      'companyId': lessonModel.companyId,
      'createdAt': lessonModel.createdAt.microsecondsSinceEpoch,
      'name': lessonModel.name,
      'status': lessonModel.status.toLessonString(),
      'summary': SummarySerializer.of(summaryModel: lessonModel.summary).toMap(),
    };
  }

  static LessonModel fromMap(Map<String, dynamic> map) {
    return LessonModel(
      map['name'] ?? '',
      (map['status'] ?? '').toString().toLessonStatus(),
      map['summary'] != null ? SummarySerializer.fromMap(map['summary']) : SummaryModel(),
      DateHelper.getDateByEpoch(map['created_at']?.toInt()),
      id: map['id'],
      companyId: map['company_id'],
    );
  }

  String toJson() => json.encode(toMap());

  static LessonModel fromJson(String source) => LessonSerializer.fromMap(json.decode(source));
}
