import 'package:equatable/equatable.dart';

import '../model/class_item_model.dart';

typedef ClassList = List<ClassItemModel?>;

class ClassListState extends Equatable {
  const ClassListState({
    required this.isLoading,
    required this.classes,
    required this.action,
    required this.error,
  });

  factory ClassListState.loading({
    ClassList? classes,
  }) =>
      ClassListState(
        classes: classes ?? [],
        error: ClassListError.none,
        action: ClassListAction.none,
        isLoading: true,
      );

  factory ClassListState.fetched({
    required ClassList classes,
  }) =>
      ClassListState(
        classes: classes,
        error: ClassListError.none,
        action: ClassListAction.none,
        isLoading: false,
      );

  factory ClassListState.deletedItem({
    required ClassList classes,
  }) =>
      ClassListState(
        classes: classes,
        error: ClassListError.none,
        action: ClassListAction.deleted,
        isLoading: false,
      );

  factory ClassListState.error({
    ClassList? classes,
  }) =>
      ClassListState(
        classes: classes ?? [],
        error: ClassListError.generic,
        action: ClassListAction.none,
        isLoading: false,
      );

  final bool isLoading;
  final ClassList classes;
  final ClassListAction action;
  final ClassListError error;

  @override
  List<Object?> get props => [
        isLoading,
        classes,
        action,
        error,
      ];

  @override
  String toString() {
    return '''
{
  isLoading: $isLoading,
  classes: ${classes.toString()},
  action: ${action.name}
  error: ${error.name},
  hashCode: $hashCode,
}    
    ''';
  }
}

enum ClassListError {
  none,
  generic,
}

enum ClassListAction {
  none,
  deleted,
}
