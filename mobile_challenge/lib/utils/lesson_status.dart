enum LessonStatus {
  notStarted,
  inProgress,
  completed,
}

lessonStatusFromString(String status) {
  if (status == "NOT_STARTED") {
    return LessonStatus.notStarted;
  } else if (status == "IN_PROGRESS") {
    return LessonStatus.inProgress;
  } else if (status == "COMPLETED") {
    return LessonStatus.completed;
  } else {
    throw Exception("Invalid lesson status: $status");
  }
}
