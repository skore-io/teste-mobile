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
