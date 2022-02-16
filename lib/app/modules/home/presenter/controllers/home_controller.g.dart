// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$todoClassAtom = Atom(name: '_HomeControllerBase.todoClass');

  @override
  ObservableList<TodoClassModel> get todoClass {
    _$todoClassAtom.reportRead();
    return super.todoClass;
  }

  @override
  set todoClass(ObservableList<TodoClassModel> value) {
    _$todoClassAtom.reportWrite(value, super.todoClass, () {
      super.todoClass = value;
    });
  }

  final _$getListAsyncAction = AsyncAction('_HomeControllerBase.getList');

  @override
  Future<void> getList() {
    return _$getListAsyncAction.run(() => super.getList());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic removeItemList(int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.removeItemList');
    try {
      return super.removeItemList(index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todoClass: ${todoClass}
    ''';
  }
}
