import 'package:cloud_firestore/cloud_firestore.dart';

class SubjectsData {
  late String id, companyId, name, status, idDocument;
  late int createdAt;
  late Map<String, dynamic> summary;

  SubjectsData.fromDocument(DocumentSnapshot document) {
    idDocument = document.id;
    id = document.get("id");;
    companyId = document.get("company_id");
    name = document.get("name");
    status = document.get("status");
    createdAt = document.get("created_at");
    summary = document.get("summary");
    

  }

  Map<String, dynamic> subjectsDataToResumedMap() {
    return {
      "id": id,
      "company_id": companyId,
      "name": name,
      "status": status,
      "created_at": createdAt,
      "summary":summary
    };
  }
  
}
