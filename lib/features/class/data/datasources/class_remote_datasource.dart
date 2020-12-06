import 'package:minhas_aulas/features/class/data/models/class_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

abstract class ClassRemoteDataSource {
  Future<List<ClassModel>> getClasses();
}

class ClassRemoteDataSourceImpl implements ClassRemoteDataSource {
  @override
  Future<List<ClassModel>> getClasses() async {
    // Throw server error when using the real API
    await Future.delayed(Duration(milliseconds: 1500));
    String data = await rootBundle.loadString('assets/databases/class_db.json');
    final jsonResult = json.decode(data);

    return List.from(jsonResult).map((e) => ClassModel.fromJson(e)).toList();
  }
}
