import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:skoreio/core/models/classes.model.dart';

class HomeRepository {
  List<ClassModel> _classes;

  _loadClasses() async {
    String classesJsonString = await rootBundle.loadString("assets/data/classes.json");
    List<dynamic> classesMaps = jsonDecode(classesJsonString);
    _classes = List<ClassModel>.from(classesMaps.map((x) => ClassModel.fromJson(x)));
  }

  getClasses() async {
    await _loadClasses();
    return _classes;
  }
}
