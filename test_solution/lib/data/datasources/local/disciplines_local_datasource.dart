import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:test_solution/data/models/discipline_model.dart';

class DisciplinesLocalDatasource {
  final String jsonDataAsset;

  DisciplinesLocalDatasource(this.jsonDataAsset);

  var mockDatabase = <DisciplineModel>[];
  var maxTurns = 0;

  Future<List<DisciplineModel>> fetchDisciplines() async {
    await Future.delayed(const Duration(seconds: 1));
    if (mockDatabase.isEmpty && maxTurns == 0) {
      final jsonData = await rootBundle.loadString(jsonDataAsset);
      Iterable data = json.decode(jsonData);
      mockDatabase = List<DisciplineModel>.from(
        data.map(
          (x) => DisciplineModel.fromMap(x),
        ),
      );
      maxTurns = 1;
      return mockDatabase;
    } else {
      return mockDatabase;
    }
  }

  Future<void> deleteDiscipline(DisciplineModel classModel) async {
    mockDatabase.removeWhere((element) => element == classModel);
  }
}
