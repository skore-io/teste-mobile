import 'package:testeuol/models/summary_model.dart';

class AulaModel {
  final String companyId;
  final DateTime createdAt;
  final String name;
  final String id;
  final String status;
  final SummaryModel summary;

  AulaModel({
    required this.companyId,
    required this.createdAt,
    required this.name,
    required this.id,
    required this.status,
    required this.summary
  });

  factory AulaModel.fromJson(Map<String, dynamic> json) {
    return AulaModel(
        companyId: json['company_id'],
        createdAt: DateTime.fromMillisecondsSinceEpoch(json['created_at']),
        name: json['name'],
        id: json['id'],
        status: json['status'],
        summary: SummaryModel.fromJson(json['summary'])
        );
  }
}
