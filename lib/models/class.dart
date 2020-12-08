class Class {
  String companyId;
  int createdAt;
  String name;
  String id;
  Status status;
  Summary summary;

  Class({
    this.companyId,
    this.createdAt,
    this.name,
    this.id,
    this.status,
    this.summary
  });

  factory Class.fromMap(Map json){
    return Class(
      companyId: json["company_id"] == null ? null : json["company_id"],
      createdAt: json["created_at"] == null ? null : json["created_at"],
      name: json["name"] == null ? null : json["name"],
      id: json["id"] == null ? null : json["id"],
      status: json["status"] == null ? null : Status.values.firstWhere((element) => element.toString().split('.')[1] == json["status"]),
      summary: json["summary"] == null ? null : Summary.fromMap(json["summary"]),
    );
  }

  Map<String, dynamic> toMap() => {
    "company_id": companyId == null ? null : companyId,
    "created_at": createdAt == null ? null : createdAt,
    "name": name == null ? null : name,
    "id": id == null ? null : id,
    "status": status == null ? null : status.toString().split('.')[1],
    "summary": summary == null ? null : summary.toMap(),
  };
}

class Summary {
  int percentage;

  Summary({this.percentage});

  factory Summary.fromMap(Map json) => Summary(
    percentage: json['percentage']
  );

  Map<String, dynamic> toMap() => {
    "percentage": percentage
  };
}

enum Status {
  NOT_STARTED,
  IN_PROGRESS,
  COMPLETED
}