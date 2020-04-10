import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:testemobileskore/model/aula.dart';

class AulaRepository {
  static Future<List<Aula>> getAulas() async {
    String aulasJson = await rootBundle.loadString('assets/json/aulas.json');
    var aulasDecoded = json.decode(aulasJson);
    return List<Aula>.from(aulasDecoded.map((i) => Aula.fromJson(i)).toList());
  }
}
