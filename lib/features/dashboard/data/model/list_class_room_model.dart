import 'package:teste_mobile/features/dashboard/data/model/class_room_model.dart';
import 'package:teste_mobile/features/dashboard/domain/entities/class_room_entity.dart';
import 'package:teste_mobile/features/dashboard/domain/entities/list_class_room_entity.dart';
import 'package:teste_mobile/share/base/model/model.dart';

class ListClassRoomModel extends ListClassRoomEntity implements Model {
  ListClassRoomModel(
    final List<ClassRoomEntity> listClassRoom,
  ) : super(listClassRoom);

  @override
  Map<String, dynamic> toMap() {
    return {'listClassRoom': listClassRoom.map((listClassRoom) => ClassRoomModel.copy(listClassRoom).toMap()).toList()};
  }

  @override
  factory ListClassRoomModel.fromJson(List json) {
    return ListClassRoomModel(
      json.map((json) => ClassRoomModel.fromJson(json)).toList(),
    );
  }

  factory ListClassRoomModel.copy(ListClassRoomEntity listClassRoomEntity) {
    return ListClassRoomModel(
      listClassRoomEntity.listClassRoom,
    );
  }
}
