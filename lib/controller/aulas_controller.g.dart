// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aulas_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AulasController on _AulasControllerBase, Store {
  final _$modelAulasAtom = Atom(name: '_AulasControllerBase.modelAulas');

  @override
  List<AulasModel>? get modelAulas {
    _$modelAulasAtom.reportRead();
    return super.modelAulas;
  }

  @override
  set modelAulas(List<AulasModel>? value) {
    _$modelAulasAtom.reportWrite(value, super.modelAulas, () {
      super.modelAulas = value;
    });
  }

  final _$futureAtom = Atom(name: '_AulasControllerBase.future');

  @override
  Future<List<AulasModel>?>? get future {
    _$futureAtom.reportRead();
    return super.future;
  }

  @override
  set future(Future<List<AulasModel>?>? value) {
    _$futureAtom.reportWrite(value, super.future, () {
      super.future = value;
    });
  }

  final _$getAulasAsyncAction = AsyncAction('_AulasControllerBase.getAulas');

  @override
  Future getAulas() {
    return _$getAulasAsyncAction.run(() => super.getAulas());
  }

  final _$_AulasControllerBaseActionController =
      ActionController(name: '_AulasControllerBase');

  @override
  void setFuture(Future<List<AulasModel>?>? value) {
    final _$actionInfo = _$_AulasControllerBaseActionController.startAction(
        name: '_AulasControllerBase.setFuture');
    try {
      return super.setFuture(value);
    } finally {
      _$_AulasControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
modelAulas: ${modelAulas},
future: ${future}
    ''';
  }
}
