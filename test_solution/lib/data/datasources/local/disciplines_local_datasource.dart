import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:test_solution/data/models/discipline_model.dart';

class DisciplinesLocalDatasource {
  final String jsonDataAsset;

  DisciplinesLocalDatasource(this.jsonDataAsset);

  var mockDatabase = <DisciplineModel>[];
  var maxTurns = true;

  Future<List<DisciplineModel>> fetchDisciplines() async {
    await Future.delayed(const Duration(seconds: 1));
    if (mockDatabase.isEmpty && maxTurns) {
      final jsonData = await rootBundle.loadString(jsonDataAsset);
      Iterable data = json.decode(jsonData);
      mockDatabase = List<DisciplineModel>.from(
        data.map(
          (x) => DisciplineModel.fromMap(x),
        ),
      );
      maxTurns = false;
      return mockDatabase;
    } else {
      return mockDatabase;
    }
  }

  Future<void> deleteDiscipline(DisciplineModel disciplineModel) async {
    mockDatabase.removeWhere((element) => element == disciplineModel);
  }
}
