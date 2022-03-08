import 'package:flutter_test/flutter_test.dart';
import 'package:teste_mobile/model/class_model.dart';

void main() {
  Class class1 = Class.fromJson(
    {
      "company_id": "114",
      "created_at": 1578343188529,
      "name": "Aula Trigonometria",
      "id": "114_3Lj7okST2yBSYXUUByg2_349798",
      "status": "NOT_STARTED",
      "summary": {"percentage": 13}
    },
  );

  group('Map item from JSON', () {
    test('Match company id', () {
      expect(class1.companyId, "114");
    });

    test('Match created at', () {
      expect(class1.createdAt, 1578343188529);
    });
    test('Match name', () {
      expect(class1.name, "Aula Trigonometria");
    });
    test('Match id', () {
      expect(class1.id, "114_3Lj7okST2yBSYXUUByg2_349798");
    });
    test('Match summary percentage', () {
      expect(class1.summary.percentage, 13);
    });
  });
}
