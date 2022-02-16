// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$listTodoClassAtom = Atom(name: '_HomeControllerBase.listTodoClass');

  @override
  ObservableList<TodoClassModel> get listTodoClass {
    _$listTodoClassAtom.reportRead();
    return super.listTodoClass;
  }

  @override
  set listTodoClass(ObservableList<TodoClassModel> value) {
    _$listTodoClassAtom.reportWrite(value, super.listTodoClass, () {
      super.listTodoClass = value;
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
listTodoClass: ${listTodoClass}
    ''';
  }
}
