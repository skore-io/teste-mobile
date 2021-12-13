import 'dart:convert';

import 'package:skore/domain/models/summary_model.dart';

class SummarySerializer {
  SummaryModel summaryModel;

  SummarySerializer.of({
    required this.summaryModel,
  });

  Map<String, dynamic> toMap() {
    return {
      'percentage': summaryModel.percentage,
    };
  }

  static SummaryModel fromMap(Map<String, dynamic> map) {
    return SummaryModel(
      percentage: map['percentage']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  static SummaryModel fromJson(String source) => SummarySerializer.fromMap(json.decode(source));
}
