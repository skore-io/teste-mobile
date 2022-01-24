enum ClassStatus {
  COMPLETED,
  IN_PROGRESS,
  NOT_STARTED,
}

class ClassModel {
  ClassModel({
    required this.companyId,
    required this.createdAt,
    required this.id,
    required this.name,
    required this.percentage,
    required this.status,
  });

  final String companyId;
  final DateTime createdAt;
  final String id;
  final String name;
  final double percentage;
  final ClassStatus status;

  @override
  String toString() => "";
}
