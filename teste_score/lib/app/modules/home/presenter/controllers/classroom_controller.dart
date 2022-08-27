import 'package:teste_score/app/modules/home/domain/usecases/get_classroom_usecase.dart';
import 'package:teste_score/app/modules/home/presenter/controllers/events/classroom_events.dart';

class ClassRoomController {
  final GetClassRoomUseCase useCase;

  ClassRoomController({
    required this.useCase,
  });

  Stream<ClassRoomEvents> getClassRoom() async* {
    yield LoadingEvent();

    final result = await useCase();

    yield result.fold(
      (l) => ErrorEvent(message: l.message),
      (r) => SuccessGetListEvent(classRoom: r),
    );
  }
}
