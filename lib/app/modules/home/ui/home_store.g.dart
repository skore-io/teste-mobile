// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$myCoursesAtom = Atom(name: 'HomeStoreBase.myCourses');

  @override
  ObservableList<CourseEntity> get myCourses {
    _$myCoursesAtom.reportRead();
    return super.myCourses;
  }

  @override
  set myCourses(ObservableList<CourseEntity> value) {
    _$myCoursesAtom.reportWrite(value, super.myCourses, () {
      super.myCourses = value;
    });
  }

  final _$loadingCoursesAtom = Atom(name: 'HomeStoreBase.loadingCourses');

  @override
  bool get loadingCourses {
    _$loadingCoursesAtom.reportRead();
    return super.loadingCourses;
  }

  @override
  set loadingCourses(bool value) {
    _$loadingCoursesAtom.reportWrite(value, super.loadingCourses, () {
      super.loadingCourses = value;
    });
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  void setLoadingCourses(bool value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setLoadingCourses');
    try {
      return super.setLoadingCourses(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCourses(CourseEntity course) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.addCourses');
    try {
      return super.addCourses(course);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeCourse(CourseEntity course) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.removeCourse');
    try {
      return super.removeCourse(course);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
myCourses: ${myCourses},
loadingCourses: ${loadingCourses}
    ''';
  }
}
