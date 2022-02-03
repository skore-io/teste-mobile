import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:skore_app/models/subjects_data.dart';


class SubjectsManager extends ChangeNotifier {

  late List<SubjectsData> _subjects;
  List<SubjectsData> get subjects => _subjects;

  get firestore => FirebaseFirestore.instance;
  get referenceSubjects => "Subjects";



SubjectsManager(){
  
  fetchAllSubjects();
}
  



  fetchAllSubjects() async {

    final QuerySnapshot subjectsSnapshot = await firestore
        .collection(referenceSubjects)
        .get();

    _subjects = subjectsSnapshot.docs.map((e) => SubjectsData.fromDocument(e)).toList();
    notifyListeners();

    

    

  }

}