class ClasseModel {

  ClasseModel({
    this.companyId,
    this.createdAt,
    this.name,
    this.id,
    this.status,
    this.summary,
  });

  String? companyId;
  int? createdAt;
  String? name;
  String? id;
  String? status;
  Summary? summary;
  
  ClasseModel.fromJson(Map<String, dynamic> json){
    companyId = json['company_id'] ?? "";
    createdAt = json['created_at'] ?? 0;
    name = json['name'] ?? "";
    id = json['id'] ?? "";
    status = json['status'] ?? "";
    summary = Summary.fromJson(json['summary']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['company_id'] = companyId;
    _data['created_at'] = createdAt;
    _data['name'] = name;
    _data['id'] = id;
    _data['status'] = status;
    _data['summary'] = summary!.toJson();
    return _data;
  }
}

class Summary {

  Summary({
    this.percentage,
  });

   int? percentage;
  
  Summary.fromJson(Map<String, dynamic> json){
    percentage = json['percentage'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['percentage'] = percentage;
    return _data;
  }
}