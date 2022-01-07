import 'package:flutter_modular/flutter_modular.dart';
import 'package:score_cursos/app/modules/intro/intro_page.dart';
import 'package:score_cursos/app/modules/intro/intro_store.dart';

class IntroModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => IntroStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => IntroPage()),
  ];
}
