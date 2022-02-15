// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$todoClassAtom = Atom(name: '_HomeControllerBase.todoClass');

  @override
  List<TodoClassModel> get todoClass {
    _$todoClassAtom.reportRead();
    return super.todoClass;
  }

  @override
  set todoClass(List<TodoClassModel> value) {
    _$todoClassAtom.reportWrite(value, super.todoClass, () {
      super.todoClass = value;
    });
  }

  final _$getListAsyncAction = AsyncAction('_HomeControllerBase.getList');

  @override
  Future<void> getList() {
    return _$getListAsyncAction.run(() => super.getList());
  }

  @override
  String toString() {
    return '''
todoClass: ${todoClass}
    ''';
  }
}
