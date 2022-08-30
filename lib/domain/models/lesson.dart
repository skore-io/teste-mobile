import 'package:skore_mobile_challenge/domain/models/lesson_status.dart';

class Lesson {
  final String companyId;
  final DateTime createdAt;
  final String name;
  final String id;
  final LessonStatus status;
  final LessonSummary summary;

  Lesson({
    required this.companyId,
    required this.createdAt,
    required this.name,
    required this.id,
    required this.status,
    required this.summary,
  });

  factory Lesson.fromJson(Map<String, dynamic> data) {
    return Lesson(
      companyId: data['company_id'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(data['created_at']),
      name: data['name'] as String,
      id: data['id'] as String,
      status: LessonStatusMap.fromString(data['status']),
      summary: LessonSummary.fromJson(data['summary']),
    );
  }

  @override
  String toString() {
    return "super.toString()";
  }
}

class LessonSummary {
  final int percentage;

  const LessonSummary({required this.percentage});

  factory LessonSummary.fromJson(Map<String, dynamic> data) {
    return LessonSummary(
      percentage: data['percentage'] ?? 0,
    );
  }
}
