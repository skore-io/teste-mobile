import 'todo_summary.dart';

class TodoClass {
  final String companyId;
  final DateTime createdAt;
  final String name;
  final String id;
  final String status;
  final TodoSummary summary;

  TodoClass(
      {required this.companyId,
      required this.createdAt,
      required this.name,
      required this.id,
      required this.status,
      required this.summary});
}
