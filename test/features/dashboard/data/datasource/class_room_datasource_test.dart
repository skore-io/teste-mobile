import 'package:flutter_test/flutter_test.dart';
import 'package:teste_mobile/features/dashboard/data/datasource/class_room_datasource.dart';
import 'package:teste_mobile/features/dashboard/domain/entities/list_class_room_entity.dart';

void main() {
  late ClassRoomDataSource dataSource;

  setUp(() {
    dataSource = ClassRoomDataSource();
  });

  group('ClassRoomDataSource', () {
    test('should return ListClassRoomEntity', () async {
      final result = await dataSource();

      expect(result, isA<ListClassRoomEntity>());

      expect(result.listClassRoom.isNotEmpty, true);

      final expectedData = [
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

      for (var i = 0; i < result.listClassRoom.length; i++) {
        final classRoom = result.listClassRoom[i];
        final expected = expectedData[i];
        expect(classRoom.companyId, expected["company_id"]);
        expect(classRoom.createdAt, expected["created_at"]);
        expect(classRoom.name, expected["name"]);
        expect(classRoom.id, expected["id"]);
        expect(classRoom.status, expected["status"]);
        expect(classRoom.summary, expected["summary"]);
      }
    });
  });
}
