class Summary {
  final int percentage;
  final int id;

  static const _percentageMap = 'percentage';

  Summary({this.percentage, this.id});

  Summary.fromJson(Map<String, dynamic> json, {this.id})
      : percentage = json.containsKey(_percentageMap) ? json[_percentageMap] : 0;

  Map<String, dynamic> toJson() => {_percentageMap: percentage};
}