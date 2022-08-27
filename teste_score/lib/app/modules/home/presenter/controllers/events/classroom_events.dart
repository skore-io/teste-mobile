import 'package:teste_score/app/modules/home/domain/entities/classroom.dart';

abstract class ClassRoomEvents {}

class LoadingEvent extends ClassRoomEvents {}

class SuccessGetListEvent extends ClassRoomEvents {
  final List<ClassRoom> classRoom;

  SuccessGetListEvent({
    required this.classRoom,
  });
}

class ErrorEvent extends ClassRoomEvents {
  final String message;

  ErrorEvent({
    required this.message,
  });
}
