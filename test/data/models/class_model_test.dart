import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:minhas_aulas/features/class/data/models/class_model.dart';
import 'package:minhas_aulas/features/class/domain/entities/class.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  final tClassModel = ClassModel(
    companyId: "114",
    createdAt: 1571323199864,
    name: "Aula Álgebra",
    id: "114_0v62DokeArxPA9oDSBst_349785",
    status: ClassStatus.inProgress,
    summary: ClassSummaryModel(percentage: 20),
  );

  group('ClassModel', () {
    test('should be a subclass of Entry entity', () async {
      // assert
      expect(tClassModel, isA<Class>());
    });

    group('fromJSON', () {
      test('should return a valid model when the JSON is valid', () async {
        // arrange
        final Map<String, dynamic> jsonMap = json.decode(fixture('class.json'));
        // act
        final result = ClassModel.fromJson(jsonMap);
        // assert
        expect(result, tClassModel);
      });
    });

    group('toJSON', () {
      test('should return a JSON map containing the proper data', () async {
        // act
        final result = tClassModel.toJson();
        // assert
        final expectedJsonMap = {
          "company_id": "114",
          "created_at": 1571323199864,
          "name": "Aula Álgebra",
          "id": "114_0v62DokeArxPA9oDSBst_349785",
          "status": "IN_PROGRESS",
          "summary": {"percentage": 20}
        };
        expect(result, expectedJsonMap);
      });
    });
  });
}
