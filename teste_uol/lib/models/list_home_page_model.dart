class ListHomePageModel {
  String? companyId;
  int? createdAt;
  String? name;
  String? id;
  String? status;
  Summary? summary;

  ListHomePageModel(
      {this.companyId,
      this.createdAt,
      this.name,
      this.id,
      this.status,
      this.summary});

  ListHomePageModel.fromJson(Map<String, dynamic> json) {
    companyId = json['company_id'];
    createdAt = json['created_at'];
    name = json['name'];
    id = json['id'];
    status = json['status'];
    summary =
        json['summary'] != null ? Summary.fromJson(json['summary']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['company_id'] = companyId;
    data['created_at'] = createdAt;
    data['name'] = name;
    data['id'] = id;
    data['status'] = status;
    if (summary != null) {
      data['summary'] = summary!.toJson();
    }
    return data;
  }
}

class Summary {
  int? percentage;

  Summary({this.percentage});

  Summary.fromJson(Map<String, dynamic> json) {
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['percentage'] = percentage;
    return data;
  }
}
