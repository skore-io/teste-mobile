import 'package:flutter_modular/flutter_modular.dart';
import 'package:score_cursos/app/common/core/config_manager.dart';
import 'package:score_cursos/app/common/preferences/local_preferences.dart';
import 'package:score_cursos/app/common/preferences/local_preferences_interface.dart';
import 'package:score_cursos/app/common/utils/constants.dart';
import 'package:score_cursos/app/modules/home/home_module.dart';
import 'package:score_cursos/app/modules/intro/intro_module.dart';
import 'package:score_cursos/app/modules/splash/splash_module.dart';

class AppModule extends Module{
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ConfigManager(i.get<LocalPreferencesInterface>())),

    // Implements
    Bind.lazySingleton((i) => SharedLocalPreferences()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    ModuleRoute(introRoute, module: IntroModule()),
    ModuleRoute(homeRoute, module: HomeModule()),
  ];

}