import 'package:skore/domain/enums/lesson_status.dart';
import 'package:skore/domain/models/summary_model.dart';

class LessonModel {
  String? id;
  String? companyId;
  DateTime createdAt;
  String name;
  LessonStatus status;
  SummaryModel summary;

  LessonModel(this.name, this.status, this.summary, this.createdAt, {this.companyId, this.id});
}
