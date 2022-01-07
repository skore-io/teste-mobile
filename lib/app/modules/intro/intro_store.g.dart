// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intro_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$IntroStore on _IntroStoreBase, Store {
  final _$currentAtom = Atom(name: '_IntroStoreBase.current');

  @override
  int get current {
    _$currentAtom.reportRead();
    return super.current;
  }

  @override
  set current(int value) {
    _$currentAtom.reportWrite(value, super.current, () {
      super.current = value;
    });
  }

  final _$_IntroStoreBaseActionController =
      ActionController(name: '_IntroStoreBase');

  @override
  dynamic setCurrent(dynamic i) {
    final _$actionInfo = _$_IntroStoreBaseActionController.startAction(
        name: '_IntroStoreBase.setCurrent');
    try {
      return super.setCurrent(i);
    } finally {
      _$_IntroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
current: ${current}
    ''';
  }
}
