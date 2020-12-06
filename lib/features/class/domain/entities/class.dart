import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:minhas_aulas/core/error/exception.dart';

enum ClassStatus { inProgress, notStarted, completed }

extension ClassStatusExtension on ClassStatus {
  static ClassStatus create(String value) {
    switch (value) {
      case 'IN_PROGRESS':
        return ClassStatus.inProgress;
      case 'NOT_STARTED':
        return ClassStatus.notStarted;
      case 'COMPLETED':
        return ClassStatus.completed;
      default:
        throw EnumException(message: 'invalid value to ClassStatus Enum');
    }
  }

  get value {
    switch (this) {
      case ClassStatus.inProgress:
        return 'IN_PROGRESS';
      case ClassStatus.notStarted:
        return 'NOT_STARTED';
      case ClassStatus.completed:
        return 'COMPLETED';
    }
  }
}

class ClassSummary extends Equatable {
  ClassSummary({
    @required this.percentage,
  });
  final int percentage;

  @override
  List<Object> get props => [percentage];
}

class Class extends Equatable {
  Class({
    @required this.companyId,
    @required this.createdAt,
    @required this.name,
    @required this.id,
    @required this.status,
    @required this.summary,
  });

  final String companyId;

  final int createdAt;

  final String name;

  final String id;

  final ClassStatus status;

  final ClassSummary summary;

  @override
  List<Object> get props => [
        companyId,
        createdAt,
        name,
        id,
        status,
        summary,
      ];
}
