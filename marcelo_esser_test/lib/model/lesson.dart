import 'package:marcelo_esser_test/model/summary.dart';

class Class {
  final String companyId;
  final int createdAt;
  final String name;
  final String id;
  final String status;
  final Summary summary;
  final int summaryKey;

  Class(this.companyId, this.createdAt, this.name, this.id, this.status,
      this.summary, this.summaryKey);
}