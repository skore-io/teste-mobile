// To parse this JSON data, do
//
//     final classesModel = classesModelFromJson(jsonString);

import 'dart:convert';

class ClassesModel {
  ClassesModel({
    this.companyId,
    this.createdAt,
    this.name,
    this.id,
    this.status,
    this.summary,
  });

  final String companyId;
  final int createdAt;
  final String name;
  final String id;
  final String status;
  final Summary summary;

  factory ClassesModel.fromRawJson(String str) => ClassesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ClassesModel.fromJson(Map<String, dynamic> json) => ClassesModel(
        companyId: json["company_id"] == null ? null : json["company_id"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        name: json["name"] == null ? null : json["name"],
        id: json["id"] == null ? null : json["id"],
        status: json["status"] == null ? null : json["status"],
        summary: json["summary"] == null ? null : Summary.fromJson(json["summary"]),
      );

  Map<String, dynamic> toJson() => {
        "company_id": companyId == null ? null : companyId,
        "created_at": createdAt == null ? null : createdAt,
        "name": name == null ? null : name,
        "id": id == null ? null : id,
        "status": status == null ? null : status,
        "summary": summary == null ? null : summary.toJson(),
      };
}

class Summary {
  Summary({
    this.percentage,
  });

  final int percentage;

  factory Summary.fromRawJson(String str) => Summary.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        percentage: json["percentage"] == null ? null : json["percentage"],
      );

  Map<String, dynamic> toJson() => {
        "percentage": percentage == null ? null : percentage,
      };
}
