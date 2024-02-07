
import 'package:teste_mobile/features/dashboard/domain/entities/list_class_room_entity.dart';
import 'package:teste_mobile/features/dashboard/domain/repository/class_room_repository.dart';

abstract class ClassRoomUseCase {
  Future<ListClassRoomEntity> call();
}

class ClassRoomUseCaseImpl implements ClassRoomUseCase {
  final ClassRoomRepository repository;

  ClassRoomUseCaseImpl(this.repository);

  @override
  Future<ListClassRoomEntity> call() async {
    return await repository();
  }
}