import 'package:equatable/equatable.dart';

class SummaryModel extends Equatable {
  final dynamic percentage;
  const SummaryModel({
    required this.percentage,
  });

  SummaryModel copyWith({
    dynamic percentage,
  }) {
    return SummaryModel(
      percentage: percentage ?? this.percentage,
    );
  }

  factory SummaryModel.fromMap(Map<String, dynamic> map) {
    return SummaryModel(
      percentage: map['percentage'],
    );
  }

  @override
  String toString() => 'SummaryModel(percentage: $percentage)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SummaryModel && other.percentage == percentage;
  }

  @override
  int get hashCode => percentage.hashCode;

  @override
  List<Object?> get props => [
        percentage,
      ];
}
