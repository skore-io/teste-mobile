import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:testemobileskore/model/aula.dart';

class AulaBloc {
  final BehaviorSubject<List<Aula>> _aulasController =
  BehaviorSubject<List<Aula>>.seeded(List<Aula>());

  Stream<List<Aula>> get getAulas =>
      _aulasController.stream.transform(_ordenarLista);

  List<Aula> _aulas;

  void delete(Aula aula){
    _aulas.firstWhere((element) => element.id == aula.id).deleted = true;
    _aulasController.add(_aulas);
  }

  void undelete(Aula aula){
    _aulas.firstWhere((element) => element.id == aula.id).deleted = false;
    _aulasController.add(_aulas);
  }

  void setAulas(List<Aula> aulas) {
    if (aulas == _aulas) return;
    _aulas = aulas;
    _aulasController.add(aulas);
  }

  final _ordenarLista = StreamTransformer<List<Aula>, List<Aula>>.fromHandlers(
      handleData: (aulas, sink) {
        aulas.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        sink.add(aulas);
      });

  void dispose() => _aulasController.close();
}
