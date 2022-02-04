import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skore_app/models/data/subjects_data.dart';
import 'package:uuid/uuid.dart';

class SubjectsManager extends ChangeNotifier {

  List<SubjectsData> _subjects = [];
  List<SubjectsData> get subjects => _subjects;

  FirebaseFirestore get firestore => FirebaseFirestore.instance;
  get referenceSubjects => "Subjects";

  
  //Adicionar o nome da Disciplina para posteriormente ser utilizado na adição de um novo card
  String _nameSubject = "";
  String get nameSubject => _nameSubject;
  set nameClass(String value){
    _nameSubject = value;
    notifyListeners();
  }

  //Construtor criado para fazer a requisição dos dados no momento que o provider for inicializado.
  SubjectsManager(){
    fetchAllSubjects();
  }
  

  //Metodo para recuperar todas as aulas registradas no banco de dados
    fetchAllSubjects() async {

    final QuerySnapshot subjectsSnapshot = await firestore
        .collection(referenceSubjects)
        .orderBy("created_at", descending: false)
        .get();

    _subjects = subjectsSnapshot.docs.map((e) => SubjectsData.fromDocument(e)).toList();
    notifyListeners();

  }

  //Método para deletar uma aula
    fetchDeleteSubject(String idDocument) async {
    
      await firestore.collection(referenceSubjects).doc(idDocument).delete();
      notifyListeners();
      fetchAllSubjects();
    }


  //Método para adicionar uma nova aula
    fetchAddSubject(BuildContext context) async {

      if(_nameSubject.length > 0){
      
      await firestore.collection(referenceSubjects).add(subjectsDataMockToResumedMap(_nameSubject));
      
      notifyListeners();
      _nameSubject = ""; 
      fetchAllSubjects();
      Navigator.pop(context);

      }
    
    }

    Map<String, dynamic> subjectsDataMockToResumedMap(String title) {
    return {
      "id": Uuid().v1(),
      "company_id": "114" ,
      "name": title,
      "status": "IN_PROGRESS",
      "created_at": DateTime.now().millisecondsSinceEpoch,
      "summary":{"percentage": Random().nextInt(100)}
    };
  }
}

