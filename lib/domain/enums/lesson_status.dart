enum LessonStatus { inProgress, notStarted, completed }

extension GetLessonStatusByEnum on LessonStatus {
  String toLessonString() {
    switch (this) {
      case LessonStatus.inProgress:
        return 'IN_PROGRESS';
      case LessonStatus.notStarted:
        return 'NOT_STARTED';
      case LessonStatus.completed:
        return 'COMPLETED';
      default:
        return throw Exception('Lesson status not implemented');
    }
  }
}

extension GetLessonStatusByString on String {
  LessonStatus toLessonStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return LessonStatus.inProgress;
      case 'NOT_STARTED':
        return LessonStatus.notStarted;
      case 'COMPLETED':
        return LessonStatus.completed;
      default:
        return throw Exception('Lesson status not implemented');
    }
  }
}
