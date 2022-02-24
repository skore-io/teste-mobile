import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:test_solution/data/models/summary_model.dart';

class DisciplineModel extends Equatable {
  final String companyId;
  final int createdAt;
  final String name;
  final String id;
  final String status;
  final SummaryModel summary;
  const DisciplineModel({
    required this.companyId,
    required this.createdAt,
    required this.name,
    required this.id,
    required this.status,
    required this.summary,
  });

  DisciplineModel copyWith({
    String? companyId,
    int? createdAt,
    String? name,
    String? id,
    String? status,
    SummaryModel? summary,
  }) {
    return DisciplineModel(
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

  factory DisciplineModel.fromMap(Map<String, dynamic> map) {
    return DisciplineModel(
      companyId: map['company_id'] ?? '',
      createdAt: map['created_at']?.toInt() ?? 0,
      name: map['name'] ?? '',
      id: map['id'] ?? '',
      status: map['status'] ?? '',
      summary: SummaryModel.fromMap(map['summary']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DisciplineModel.fromJson(String source) =>
      DisciplineModel.fromMap(json.decode(source));

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
