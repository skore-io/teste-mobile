enum LessonStatus {
  notStarted,
  inProgress,
  completed,
}

extension LessonStatusMap on LessonStatus {
  static const valueMap = {
    LessonStatus.notStarted: "NOT_STARTED",
    LessonStatus.inProgress: "IN_PROGRESS",
    LessonStatus.completed: "COMPLETED",
  };

  String? get value => valueMap[this];

  static LessonStatus fromString(String input) {
    final reverseValueMap = valueMap.map<String, LessonStatus>((key, value) => MapEntry(value, key));

    LessonStatus? output = reverseValueMap[input];
    if (output == null) {
      throw 'Invalid String Input';
    }

    return output;
  }
}
