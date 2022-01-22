import 'dart:convert';

import 'package:equatable/equatable.dart';

class ClassItemModel extends Equatable {
  const ClassItemModel({
    required this.companyId,
    required this.createdAt,
    required this.name,
    required this.id,
    required this.status,
    required this.percentage,
  });

  static ClassItemModel? fromMap(
    Map<String, dynamic>? map,
  ) {
    if (map == null) {
      return null;
    }

    try {
      return ClassItemModel(
        companyId: map['company_id'] as String,
        createdAt:
            DateTime.fromMicrosecondsSinceEpoch(map['created_at'] as int),
        name: map['name'] as String,
        id: map['id'] as String,
        status: ClassStatusConverter.fromString(
          map['status'] as String,
        ),
        percentage:
            (map['summary'] as Map<String, dynamic>)['percentage'] as double,
      );
    } on Exception {
      return null;
    }
  }

  static ClassItemModel? fromJson(String source) => ClassItemModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  final String companyId;
  final DateTime createdAt;
  final String name;
  final String id;
  final ClassStatus status;
  final double? percentage;

  Map<String, dynamic> toMap() => {
        'company_id': companyId,
        'created_at': createdAt.microsecondsSinceEpoch,
        'name': name,
        'id': id,
        'status': status.toStringMap(),
        'summary': {
          'percentage': percentage,
        }
      };

  String toJson() => json.encode(toMap());

  ClassItemModel copyWith({
    ClassStatus? status,
    double? percentage,
  }) =>
      ClassItemModel(
        companyId: companyId,
        createdAt: createdAt,
        name: name,
        id: id,
        status: status ?? this.status,
        percentage: percentage ?? this.percentage,
      );

  @override
  List<Object?> get props => [
        companyId,
        createdAt,
        name,
        id,
        status,
        percentage,
      ];

  @override
  String toString() {
    return '''
{
  company_id: $companyId,
  created_at: ${createdAt.toIso8601String()},
  name: $name,
  id: $id,
  status: ${status.toStringMap()},
  summary: {
    percentage: $percentage,
  }
  hashCode: $hashCode,
}    
    ''';
  }
}

enum ClassStatus {
  none,
  notStated,
  completed,
  inProgress,
  deleted,
}

extension ClassStatusConverter on ClassStatus {
  static ClassStatus fromString(String value) {
    switch (value) {
      case 'IN_PROGRESS':
        return ClassStatus.inProgress;
      case 'NOT_STARTED':
        return ClassStatus.notStated;
      case 'COMPLETED':
        return ClassStatus.completed;
      case 'DELETED':
        return ClassStatus.deleted;
      default:
        return ClassStatus.none;
    }
  }

  String toStringMap() {
    switch (this) {
      case ClassStatus.inProgress:
        return 'IN_PROGRESS';
      case ClassStatus.notStated:
        return 'NOT_STARTED';
      case ClassStatus.completed:
        return 'COMPLETED';
      case ClassStatus.deleted:
        return 'DELETED';
      default:
        return 'NONE';
    }
  }
}
