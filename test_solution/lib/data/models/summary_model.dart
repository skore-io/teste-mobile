import 'dart:convert';

class SummaryModel {
  final dynamic percentage;
  SummaryModel({
    required this.percentage,
  });

  SummaryModel copyWith({
    dynamic percentage,
  }) {
    return SummaryModel(
      percentage: percentage ?? this.percentage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'percentage': percentage,
    };
  }

  factory SummaryModel.fromMap(Map<String, dynamic> map) {
    return SummaryModel(
      percentage: map['percentage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SummaryModel.fromJson(String source) =>
      SummaryModel.fromMap(json.decode(source));

  @override
  String toString() => 'SummaryModel(percentage: $percentage)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SummaryModel && other.percentage == percentage;
  }

  @override
  int get hashCode => percentage.hashCode;
}
