class SummaryModel {
  final int percentage;

  SummaryModel({required this.percentage});

  factory SummaryModel.fromJson(Map<String, dynamic> json) {
    return SummaryModel(
        percentage: json['percentage'] ?? 0,
    );
  }
}