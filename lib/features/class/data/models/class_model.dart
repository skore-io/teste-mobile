import 'package:minhas_aulas/features/class/domain/entities/class.dart';

class ClassSummaryModel extends ClassSummary {
  ClassSummaryModel({
    int percentage,
  }) : super(percentage: percentage);

  factory ClassSummaryModel.fromJson(Map<String, dynamic> json) {
    return ClassSummaryModel(percentage: json['percentage'] ?? 0);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['percentage'] = percentage;
    return data;
  }
}

class ClassModel extends Class {
  ClassModel({
    String companyId,
    int createdAt,
    String name,
    String id,
    ClassStatus status,
    ClassSummary summary,
  }) : super(
          companyId: companyId,
          createdAt: createdAt,
          name: name,
          id: id,
          status: status,
          summary: summary,
        );

  factory ClassModel.fromJson(Map<String, dynamic> json) {
    return ClassModel(
      companyId: json['company_id'],
      createdAt: json['created_at'],
      name: json['name'],
      id: json['id'],
      status: ClassStatusExtension.create(json['status']),
      summary: json['summary'] != null
          ? ClassSummaryModel.fromJson(json['summary'])
          : ClassSummaryModel(percentage: 0),
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['company_id'] = companyId;
    data['created_at'] = createdAt;
    data['name'] = name;
    data['id'] = id;
    data['status'] = status.value;
    if (summary != null) {
      data['summary'] = (summary as ClassSummaryModel).toJson();
    }
    return data;
  }
}
