import 'package:testemobileskore/model/summary.dart';

// generated by https://javiercbk.github.io/json_to_dart/
class Aula {
  String companyId;
  int createdAt;
  String name;
  String id;
  String status;
  Summary summary;

  //added by me
  bool deleted = false;

  Aula(
      {this.companyId,
      this.createdAt,
      this.name,
      this.id,
      this.status,
      this.summary});

  Aula.fromJson(Map<String, dynamic> json) {
    companyId = json['company_id'];
    createdAt = json['created_at'];
    name = json['name'];
    id = json['id'];
    status = json['status'];
    summary =
        json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company_id'] = this.companyId;
    data['created_at'] = this.createdAt;
    data['name'] = this.name;
    data['id'] = this.id;
    data['status'] = this.status;
    if (this.summary != null) {
      data['summary'] = this.summary.toJson();
    }
    return data;
  }

  DateTime getCreatedDate() {
    return DateTime.fromMillisecondsSinceEpoch(this.createdAt);
  }
}