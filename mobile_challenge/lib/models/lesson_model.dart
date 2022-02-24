import 'package:mobile_challenge/utils/lesson_status.dart';

import '../utils/utils.dart';

class LessonModel {
  late String companyId;
  late int createdAt;
  late String name;
  late String id;
  late LessonStatus status;
  late Summary summary;

  LessonModel({
    required this.companyId,
    required this.createdAt,
    required this.name,
    required this.id,
    required this.status,
    required this.summary,
  });

  LessonModel.fromJson(Map<String, dynamic> json) {
    companyId = json['company_id'];
    createdAt = json['created_at'];
    name = json['name'];
    id = json['id'];
    status = lessonStatusFromString(json['status']);
    summary = Summary.fromJson(json['summary']);
  }

  String get dateFormated =>
      dateFormat.format(DateTime.fromMillisecondsSinceEpoch(createdAt));

  LessonModel copyWith({
    String? companyId,
    int? createdAt,
    String? name,
    String? id,
    LessonStatus? status,
    Summary? summary,
  }) {
    return LessonModel(
      companyId: companyId ?? this.companyId,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      id: id ?? this.id,
      status: status ?? this.status,
      summary: summary ?? this.summary,
    );
  }
}

class Summary {
  int? percentage;

  Summary({this.percentage});

  Summary.fromJson(Map<String, dynamic> json) {
    percentage = json['percentage'];
  }
}
