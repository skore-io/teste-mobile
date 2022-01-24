import 'dart:convert';

import '../../domain/models/class_model.dart';

class ClassDto extends ClassModel {
  ClassDto({
    required this.companyId,
    required this.createdAt,
    required this.id,
    required this.name,
    required this.percentage,
    required this.status,
  }) : super(
          companyId: companyId,
          createdAt: createdAt,
          id: id,
          name: name,
          percentage: percentage,
          status: status,
        );

  final String companyId;
  final DateTime createdAt;
  final String id;
  final String name;
  final double percentage;
  final ClassStatus status;

  factory ClassDto.fromMap(Map<String, dynamic> map) {
    return ClassDto(
      companyId: map["company_id"].toString().trim(),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map["created_at"]),
      id: map["id"].toString().trim(),
      name: map["name"].toString().trim(),
      status: statusFromString(map["status"].toString().toUpperCase().trim()),
      percentage: map["summary"]["percentage"] != null
          ? double.parse(map["summary"]["percentage"].toString())
          : 0.0,
    );
  }

  Map<String, dynamic> get toMap {
    Map<String, dynamic> dtoMap = {
      "company_id": companyId,
      "created_at": createdAt.millisecondsSinceEpoch,
      "name": name,
      "id": id,
      "status": statusToString(status),
      "summary": {
        "percentage": percentage,
      }
    };

    return dtoMap;
  }

  factory ClassDto.fromJson(String json) => ClassDto.fromMap(jsonDecode(json));

  String get toJson => jsonEncode(this.toMap);

  static List<ClassDto> listFromJson(String json) {
    List jsonList = jsonDecode(json);

    if (jsonList.isEmpty) return [];

    List<ClassDto> classesList = [];

    jsonList.forEach(
      (oneClasse) {
        classesList.add(ClassDto.fromMap(oneClasse));
      },
    );

    return classesList;
  }

  static ClassStatus statusFromString(String status) {
    switch (status) {
      case "COMPLETED":
        return ClassStatus.COMPLETED;
      case "IN_PROGRESS":
        return ClassStatus.IN_PROGRESS;
      default:
        return ClassStatus.NOT_STARTED;
    }
  }

  static String statusToString(ClassStatus status) {
    switch (status) {
      case ClassStatus.COMPLETED:
        return "COMPLETED";
      case ClassStatus.IN_PROGRESS:
        return "IN_PROGRESS";
      default:
        return "NOT_STARTED";
    }
  }
}
