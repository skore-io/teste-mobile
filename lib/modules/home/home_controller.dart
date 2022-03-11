import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:testeuol/models/aula_model.dart';
import 'package:testeuol/modules/common/show_dialog.dart';

import 'home_repository.dart';
import 'home_state.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  final aulasNotifier = ValueNotifier<List<AulaModel>>(List.empty());

  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  set aulasNot(List<AulaModel> value) => aulasNotifier.value = value;
  List<AulaModel> get aulasNot => aulasNotifier.value;

  List<AulaModel>? aulas;

  final repository = HomeRepository();

  void getAulas() async {
    state = HomeState.loading;
    aulas = await repository.getAulas();
    aulasNot = aulas!.toList();
    state = HomeState.success;
  }

  Future<void> remove(AulaModel aula, BuildContext context) async {
    if (await ShowDialog.dialogSN("Remover aula", "Tem certeza que deseja remover a aula?", context)) {
      aulas!.remove(aula);
      aulasNot = aulas!.toList();
    }
  }
}
