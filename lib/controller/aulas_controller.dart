import 'package:flutter_uol_skore_teste/models/aulas_model.dart';
import 'package:flutter_uol_skore_teste/reporitory/aulas_repository.dart';
import 'package:mobx/mobx.dart';

part 'aulas_controller.g.dart';

class AulasController = _AulasControllerBase with _$AulasController;

abstract class _AulasControllerBase with Store{
    final AulasRepository _repositoryAulas = AulasRepository();

    @observable
    List<AulasModel>? modelAulas = [];

    @observable
    Future<List<AulasModel>?>? future;

    @action
    void setFuture(Future<List<AulasModel>?>? value) => future = value;

    @action
    getAulas() async{
      try{
        await _repositoryAulas.getAulasRepository().then((value){
          modelAulas = value;
        });
      }catch(e){
        throw Exception(e);
      }
    }

}