abstract class IClassRoomException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  const IClassRoomException({
    required this.message,
    required this.stackTrace,
  });
}

class ClassRoomException extends IClassRoomException {
  const ClassRoomException({
    required String message,
    StackTrace? stackTrace,
  }) : super(
          message: message,
          stackTrace: stackTrace,
        );
}
