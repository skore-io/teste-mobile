import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_score/app/modules/home/home_module.dart';
import 'package:teste_score/app/modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  final List<Module> imports = [
    SplashModule(),
    HomeModule(),
  ];

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: SplashModule()),
    ModuleRoute('/home', module: HomeModule()),
  ];
}
