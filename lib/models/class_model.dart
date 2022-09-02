import 'package:flutter/material.dart';
import 'package:my_classes/models/summary_model.dart';

class ClassModel with ChangeNotifier {
  String? companyId;
  int? createdAt;
  String? name;
  String? id;
  String? status;
  Summary? summary;

  ClassModel({
    this.companyId,
    this.createdAt,
    this.name,
    this.id,
    this.status,
    this.summary,
  });

  ClassModel.fromJson(Map<String, dynamic> json) {
    companyId = json['company_id'];
    createdAt = json['created_at'];
    name = json['name'];
    id = json['id'];
    status = json['status'];
    summary = json['summary'];
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
