// To parse this JSON data, do
//
//     final classesModel = classesModelFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

class ClassModel {
  ClassModel({
    this.companyId,
    this.createdAt,
    this.name,
    this.id,
    this.status,
    this.summary,
  });

  final String companyId;
  final DateTime createdAt;
  final String name;
  final String id;
  final String status;
  final Summary summary;

  String get createdAtFormatted => DateFormat("dd/MM/yyyy HH:mm").format(createdAt);

  factory ClassModel.fromRawJson(String str) => ClassModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ClassModel.fromJson(Map<String, dynamic> json) => ClassModel(
        companyId: json["company_id"] == null ? null : json["company_id"],
        createdAt: json["created_at"] == null ? null : DateTime.fromMillisecondsSinceEpoch(json["created_at"]),
        name: json["name"] == null ? null : json["name"],
        id: json["id"] == null ? null : json["id"],
        status: json["status"] == null ? null : json["status"],
        summary: json["summary"] == null ? null : Summary.fromJson(json["summary"]),
      );

  Map<String, dynamic> toJson() => {
        "company_id": companyId == null ? null : companyId,
        "created_at": createdAt == null ? null : createdAtFormatted,
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
        percentage: json["percentage"] == null ? 0 : json["percentage"],
      );

  Map<String, dynamic> toJson() => {
        "percentage": percentage == null ? 0 : percentage,
      };
}
