import 'package:teste_mobile/features/dashboard/data/model/class_room_model.dart';
import 'package:teste_mobile/features/dashboard/data/model/list_class_room_model.dart';
import 'package:teste_mobile/features/dashboard/domain/entities/list_class_room_entity.dart';
import 'package:teste_mobile/share/base/datasource/datasource.dart';

class ClassRoomDataSource implements DataSource<dynamic> {
  @override
  Future<ListClassRoomEntity> call({FromJson<dynamic>? fromJson, Map<String, dynamic>? param, dynamic data}) async {
    final classRoom = (json).map((event) => ClassRoomModel.fromJson(event)).toList();

    final listClassRoom = ListClassRoomModel(classRoom);
    return listClassRoom;
  }

  final json = [
    {
      "company_id": "114",
      "created_at": 1571323199864,
      "name": "Aula Álgebra",
      "id": "114_0v62DokeArxPA9oDSBst_349785",
      "status": "IN_PROGRESS",
      "summary": {"percentage": 20}
    },
    {
      "company_id": "114",
      "created_at": 1578343188529,
      "name": "Aula Trigonometria",
      "id": "114_3Lj7okST2yBSYXUUByg2_349798",
      "status": "NOT_STARTED",
      "summary": {"percentage": null}
    },
    {
      "company_id": "114",
      "created_at": 1568918240759,
      "name": "Aula Filosofia",
      "id": "114_3O81FOuWLZIlSDnRJHm1_349798",
      "status": "COMPLETED",
      "summary": {"percentage": 100}
    },
    {
      "company_id": "114",
      "created_at": 1574361972593,
      "name": "Aula Geografia",
      "id": "114_46keopvfEUvlNP7bd049_349798",
      "status": "IN_PROGRESS",
      "summary": {"percentage": 75}
    },
    {
      "company_id": "114",
      "created_at": 1571946887159,
      "name": "Aula História",
      "id": "114_5FK4ExJCz3vW4XmS0KVr_349798",
      "status": "NOT_STARTED",
      "summary": {"percentage": null}
    }
  ];
}



