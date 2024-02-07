import 'package:flutter_test/flutter_test.dart';
import 'package:teste_mobile/features/dashboard/data/model/class_room_model.dart';

void main() {
  group('ClassRoomModel', () {
    test('fromJson should parse json correctly', () async {
      final json = {
        "company_id": "114",
        "created_at": 1571323199864,
        "name": "Aula Álgebra",
        "id": "114_0v62DokeArxPA9oDSBst_349785",
        "status": "IN_PROGRESS",
        "summary": {"percentage": 20}
      };

      final model = ClassRoomModel.fromJson(json);

      expect(model.companyId, json["company_id"]);
      expect(model.createdAt, json["created_at"]);
      expect(model.name, json["name"]);
      expect(model.id, json["id"]);
      expect(model.status, json["status"]);
      expect(model.summary, json["summary"]);
    });

    test('toMap should return map representation of the model', () async {
      final json = {
        "company_id": "114",
        "created_at": 1571323199864,
        "name": "Aula Álgebra",
        "id": "114_0v62DokeArxPA9oDSBst_349785",
        "status": "IN_PROGRESS",
        "summary": {"percentage": 20}
      };

      final model = ClassRoomModel.fromJson(json);
      final map = model.toMap();

      expect(map["company_id"], json["company_id"]);
      expect(map["created_at"], json["created_at"]);
      expect(map["name"], json["name"]);
      expect(map["id"], json["id"]);
      expect(map["status"], json["status"]);
      expect(map["summary"], json["summary"]);
    });
  });
}
