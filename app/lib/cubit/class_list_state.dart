import 'package:app/class_item_model.dart';
import 'package:equatable/equatable.dart';

typedef ClassList = List<ClassItemModel>;

class ClassListState extends Equatable {
  const ClassListState({
    required this.isLoading,
    required this.classes,
    required this.error,
  });

  factory ClassListState.loading({
    ClassList? classes,
  }) =>
      ClassListState(
        classes: classes ?? [],
        error: ClassListError.none,
        isLoading: true,
      );

  factory ClassListState.fetched({
    required ClassList classes,
  }) =>
      ClassListState(
        classes: classes,
        error: ClassListError.none,
        isLoading: false,
      );

  factory ClassListState.error({
    ClassList? classes,
  }) =>
      ClassListState(
        classes: classes ?? [],
        error: ClassListError.none,
        isLoading: false,
      );

  final bool isLoading;
  final ClassList classes;
  final ClassListError error;

  @override
  List<Object?> get props => [
        isLoading,
        classes,
        error,
      ];

  @override
  String toString() {
    return '''
{
  isLoading: $isLoading,
  classes: ${classes.toString()},
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
