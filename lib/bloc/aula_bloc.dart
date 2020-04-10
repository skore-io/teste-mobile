import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:testemobileskore/model/aula.dart';

class AulaBloc {
  final BehaviorSubject<List<Aula>> _aulasController =
  BehaviorSubject<List<Aula>>.seeded(List<Aula>());

  Stream<List<Aula>> get getAulas =>
      _aulasController.stream;

  List<Aula> _aulas;

  void setAulas(List<Aula> aulas) {
    if (aulas == _aulas) return;
    _aulas = aulas;
    _aulasController.add(aulas);
  }

  void dispose() => _aulasController.close();
}
