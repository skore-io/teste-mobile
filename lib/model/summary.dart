class Summary {
  int percentage;

  Summary({this.percentage});

  Summary.fromJson(Map<String, dynamic> json) {
    percentage = json['percentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['percentage'] = this.percentage;
    return data;
  }
}