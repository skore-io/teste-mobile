import 'package:teste_mobile/model/summary_model.dart';

class Class {
  Class({
    required this.companyId,
    required this.createdAt,
    required this.name,
    required this.id,
    required this.status,
    required this.summary,
  });
  final String companyId;
  final int createdAt;
  final String name;
  final String id;
  final String status;
  final Summary summary;

  factory Class.fromJson(Map<String, dynamic> data) {
    final companyId = data['company_id'] as String;
    final createdAt = data['created_at'] as int;
    final name = data['name'] as String;
    final id = data['id'] as String;
    final status = data['status'] as String;
    final summary = Summary(percentage: data['summary']['percentage'] as int?);

    return Class(
        companyId: companyId,
        createdAt: createdAt,
        name: name,
        id: id,
        status: status,
        summary: summary);
  }
}
