import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:testeuol/models/aula_model.dart';

class HomeRepository {
  Future<List<AulaModel>> getAulas() async {
    final response = await rootBundle.loadString("assets/database/aulas.json");
    final list = jsonDecode(response) as List;
    List<AulaModel> aulas = list.map((e) => AulaModel.fromJson(e)).toList();
    aulas.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    return aulas;
  }
}