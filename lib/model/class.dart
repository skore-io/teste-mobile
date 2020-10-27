class Class {
  final String companyId;
  final int createdAt;
  final String name;
  final String id;
  final String status;
  final int percentage;

  Class(
      {this.companyId,
      this.createdAt,
      this.id,
      this.name,
      this.percentage,
      this.status});

  factory Class.fromJson(Map<String, dynamic> json) {
    return Class(
        companyId: json["company_id"],
        createdAt: json["created_at"],
        id: json["id"],
        name: json["name"],
        percentage: json["summary"]["percentage"] ?? 0,
        status: json["status"]);
  }
}
