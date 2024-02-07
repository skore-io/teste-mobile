import 'package:teste_mobile/features/dashboard/domain/entities/class_room_entity.dart';
import 'package:teste_mobile/share/base/model/model.dart';

class ClassRoomModel extends ClassRoomEntity implements Model {
  ClassRoomModel(
    super.companyId,
    super.createdAt,
    super.name,
    super.id,
    super.status,
    super.summary,
  );

  @override
  Map<String, dynamic> toMap() => {
        'company_id': companyId,
        'created_at': createdAt,
        'name': name,
        'id': id,
        'status': status,
        'summary': summary,
      };

  factory ClassRoomModel.fromJson(Map<String, dynamic> json) {
    return ClassRoomModel(
      json['company_id'] ?? '',
      json['created_at'] ?? 0,
      json['name'] ?? '',
      json['id'] ?? '',
      json['status'] ?? '',
      json['summary'] ?? {},
    );
  }

  factory ClassRoomModel.copy(ClassRoomEntity classRoomEntity) {
    return ClassRoomModel(
      classRoomEntity.companyId,
      classRoomEntity.createdAt,
      classRoomEntity.name,
      classRoomEntity.id,
      classRoomEntity.status,
      classRoomEntity.summary,
    );
  }
}
