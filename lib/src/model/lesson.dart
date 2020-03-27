import 'package:teste_mobile/src/model/summary.dart';

class Lesson {
  int companyId;
  DateTime createdAt;
  String name;
  String id;
  String status;
  Summary summary;

  Lesson.fromJson(Map<String, dynamic> json)
      : companyId = int.tryParse(json['company_id']),
        createdAt =
            DateTime.fromMicrosecondsSinceEpoch(json['created_at'] * 1000),
        name = json['name'],
        id = json['id'],
        status = json['status'],
        summary = Summary.fromJson(json['summary']);
}
