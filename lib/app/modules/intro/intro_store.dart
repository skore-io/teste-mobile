import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:score_cursos/app/common/core/config_manager.dart';
import 'package:score_cursos/app/common/utils/constants.dart';
import 'package:score_cursos/app/modules/intro/components/slider.component.dart';

part 'intro_store.g.dart';

class IntroStore = _IntroStoreBase with _$IntroStore;
abstract class _IntroStoreBase with Store {

  final ConfigManager _configManager = Modular.get();

  @observable
  int current = 0;

  @action
  setCurrent(i)=>current=i;

  unableFirstAcess()async{
    await _configManager.setHasFirstAccess(false);
    Modular.to.pushReplacementNamed(homeRoute);
  }
}