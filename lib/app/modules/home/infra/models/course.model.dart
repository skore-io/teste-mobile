import 'package:score_cursos/app/modules/home/domain/entities/course.entity.dart';

class Course implements CourseEntity{

  @override
  String? companyId;

  @override
  int? createdAt;

  @override
  String? name;

  @override
  String? id;

  @override
  Status? status;

  @override
  Summary? summary;

  Course(
      {this.companyId,
        this.createdAt,
        this.name,
        this.id,
        this.status,
        this.summary});

  Course.fromJson(Map<String, dynamic> json) {
    companyId = json['company_id'];
    createdAt = json['created_at'];
    name = json['name'];
    id = json['id'];
    summary = json['summary'] != null ? Summary.fromJson(json['summary']) : null;

    String s = json['status'];
    switch(s){
      case "COMPLETED":
        status = Status.COMPLETED;
        break;
      case "IN_PROGRESS":
        status = Status.IN_PROGRESS;
        break;
      default:
        status = Status.NOT_STARTED;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['company_id'] = companyId;
    data['created_at'] = createdAt;
    data['name'] = name;
    data['id'] = id;
    data['status'] = status;
    if (summary != null) {
      data['summary'] = summary!.toJson();
    }
    return data;
  }
}


