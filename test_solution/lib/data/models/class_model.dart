import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:test_solution/data/models/summary_model.dart';

class ClassModel extends Equatable {
  final String companyId;
  final int createdAt;
  final String name;
  final String id;
  final String status;
  final SummaryModel summary;
  ClassModel({
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
    SummaryModel? summary,
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
      'summary': summary.toMap(),
    };
  }

  factory ClassModel.fromMap(Map<String, dynamic> map) {
    return ClassModel(
      companyId: map['company_id'] ?? '',
      createdAt: map['created_at']?.toInt() ?? 0,
      name: map['name'] ?? '',
      id: map['id'] ?? '',
      status: map['status'] ?? '',
      summary: SummaryModel.fromMap(map['summary']),
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
