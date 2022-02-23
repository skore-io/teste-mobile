import 'dart:convert';

import 'package:equatable/equatable.dart';

class ClassModel extends Equatable {
  final String companyId;
  final int createdAt;
  final String name;
  final String id;
  final String status;
  final Map<String, int> summary;
  const ClassModel({
    required this.companyId,
    required this.createdAt,
    required this.name,
    required this.id,
    required this.status,
    required this.summary,
  });

  ClassModel copyWith({
    String? companyId,
    int? createdAt,
    String? name,
    String? id,
    String? status,
    Map<String, int>? summary,
  }) {
    return ClassModel(
      companyId: companyId ?? this.companyId,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      id: id ?? this.id,
      status: status ?? this.status,
      summary: summary ?? this.summary,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'companyId': companyId,
      'createdAt': createdAt,
      'name': name,
      'id': id,
      'status': status,
      'summary': summary,
    };
  }

  factory ClassModel.fromMap(Map<String, dynamic> map) {
    return ClassModel(
      companyId: map['company_id'] ?? '',
      createdAt: map['created_at']?.toInt() ?? 0,
      name: map['name'] ?? '',
      id: map['id'] ?? '',
      status: map['status'] ?? '',
      summary: Map<String, int>.from(map['summary']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassModel.fromJson(String source) =>
      ClassModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ClassModel(companyId: $companyId, createdAt: $createdAt, name: $name, id: $id, status: $status, summary: $summary)';
  }

  @override
  List<Object> get props {
    return [
      companyId,
      createdAt,
      name,
      id,
      status,
      summary,
    ];
  }
}
