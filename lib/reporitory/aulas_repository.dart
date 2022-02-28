import 'package:flutter_uol_skore_teste/models/aulas_model.dart';
import 'package:http/http.dart' as http;


class AulasRepository{
  Future<List<AulasModel>> getAulasRepository() async{
    late List<AulasModel> model;
    
    try{
      final response = await http.get(Uri.parse('https://my-json-server.typicode.com/AyrtonRSPorto/skore_json/lessons'));
      if(response.statusCode == 200){
        model = AulasModel.aulasModelFromJson(response.body);
      }
    }catch(ex){
      print('Erro: $ex');
    }
    return model;
  }
}