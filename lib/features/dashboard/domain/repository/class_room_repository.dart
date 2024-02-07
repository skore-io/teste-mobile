
import 'package:teste_mobile/features/dashboard/domain/entities/list_class_room_entity.dart';

abstract class ClassRoomRepository {
  Future<ListClassRoomEntity> call();
}
