enum Status{
  COMPLETED,
  IN_PROGRESS,
  NOT_STARTED
}
abstract class CourseEntity {
  String? companyId;
  int? createdAt;
  String? name;
  String? id;
  Status? status;
  Summary? summary;
}

class Summary {
  int? percentage;

  Summary({this.percentage});

  Summary.fromJson(Map<String, dynamic> json) {
    percentage = json['percentage']??0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['percentage'] = percentage;
    return data;
  }
}
