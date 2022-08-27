import 'package:teste_score/app/modules/home/domain/entities/classroom.dart';

class ClassRoomAdapter {
  static ClassRoom fromMap(dynamic map) {
    return ClassRoom(
      name: map['name'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
      id: map['id'],
      status: map['status'],
      percentage:
          double.tryParse(map['summary']['percentage'].toString()) ?? 0.00,
    );
  }
}
