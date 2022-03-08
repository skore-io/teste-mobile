import 'package:flutter_test/flutter_test.dart';
import 'package:teste_mobile/model/class_model.dart';
import 'package:teste_mobile/modules/home/home_functions.dart';

void main() {
  HomeFunctions homeFunctions = HomeFunctions();
  Class class1 = Class.fromJson(
    {
      "company_id": "114",
      "created_at": 1578343188529,
      "name": "Aula Trigonometria",
      "id": "114_3Lj7okST2yBSYXUUByg2_349798",
      "status": "NOT_STARTED",
      "summary": {"percentage": null}
    },
  );
  Class class2 = Class.fromJson(
    {
      "company_id": "114",
      "created_at": 1568918240759,
      "name": "Aula Filosofia",
      "id": "114_3O81FOuWLZIlSDnRJHm1_349798",
      "status": "COMPLETED",
      "summary": {"percentage": 100}
    },
  );

  Class class3 = Class.fromJson(
    {
      "company_id": "114",
      "created_at": 1574361972593,
      "name": "Aula Geografia",
      "id": "114_46keopvfEUvlNP7bd049_349798",
      "status": "IN_PROGRESS",
      "summary": {"percentage": 75}
    },
  );

  group('delete item', () {
    test('Match item - should remove item', () {
      List<Class> classes = [class1, class2];
      homeFunctions.deleteItem(classes, class2);
      expect(classes.length, 1);
    });

    test('No match item - should return same list', () {
      List<Class> classes = [class1, class2];
      homeFunctions.deleteItem(classes, class3);
      expect(classes.length, 2);
    });
  });

  group('Sort list by created at', () {
    test('List should be sorted', () {
      List<Class> classes = [class1, class2, class3];
      List<Class> resultClasses = homeFunctions.sortListByCreateAt(classes);
      expect(resultClasses[0].id, class1.id);
      expect(resultClasses[1].id, class3.id);
      expect(resultClasses[2].id, class2.id);
    });
  });
}
