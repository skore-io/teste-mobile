import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_solution/data/models/class_model.dart';

class ClassesLocalDatasource {
  final String jsonDataAsset;

  ClassesLocalDatasource(this.jsonDataAsset);

  Future<List<ClassModel>> fetchClasses() async {
    final jsonData = await rootBundle.loadString(jsonDataAsset);

    Iterable data = json.decode(jsonData);
    final classesList = List<ClassModel>.from(
      data.map(
        (x) => ClassModel.fromMap(x),
      ),
    );
    return classesList;
  }

  Future<void> deleteClass(ClassModel classModel) {
    throw UnimplementedError();
  }
}
