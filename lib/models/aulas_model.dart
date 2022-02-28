import 'dart:convert';

String aulasModelToJson(List<AulasModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AulasModel {
  String? companyId;
  String? createDate;
  int? createdAt;
  String? name;
  String? id;
  String? status;
  Summary? summary;

  AulasModel({
    this.companyId,
    this.createDate,
    this.createdAt,
    this.name,
    this.id,
    this.status,
    this.summary,
  });

  void deleteAulaModel(){
    companyId = null;
    createDate = null;
    createdAt = null;
    name = null;
    id = null;
    status = null;
    summary = null;

    print('teste');
  }

  static List<AulasModel> aulasModelFromJson(String str) => List<AulasModel>.from(json.decode(str).map((x) => AulasModel.fromJson(x)));

  factory AulasModel.fromJson(Map<String, dynamic> json) => AulasModel(
    companyId: json["company_id"],
    createDate: json["create_date"],
    createdAt: json["created_at"],
    name: json["name"],
    id: json["id"],
    status: json["status"],
    summary: Summary.fromJson(json["summary"]),
  );

  Map<String, dynamic> toJson() => {
    "company_id": companyId,
    "create_date": createDate,
    "created_at": createdAt,
    "name": name,
    "id": id,
    "status": status,
    "summary": summary?.toJson(),
  };
}

class Summary {
  int? percentage;

  Summary({
    this.percentage,
  });

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
    percentage: json["percentage"] == null ? null : json["percentage"],
  );

  Map<String, dynamic> toJson() => {
    "percentage": percentage == null ? null : percentage,
  };
}
