import 'package:flutter_modular/flutter_modular.dart';
import 'package:score_cursos/app/modules/home/domain/repositories/home.repository.dart';
import 'package:score_cursos/app/modules/home/domain/usecases/get_all_courses.usecase.dart';
import 'package:score_cursos/app/modules/home/infra/repositories/local.repository.dart';
import 'package:score_cursos/app/modules/home/ui/home_page.dart';
import 'package:score_cursos/app/modules/home/ui/home_store.dart';
import 'package:score_cursos/app/modules/home/usecases_impls/get_all_courses.impl.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore(
        i.get<GetAllCourses>())
    ),

    // Usecases
    Bind.lazySingleton((i) => GetAllCoursesImpl(i.get<HomeRepository>())),

    // Repositories
    Bind.lazySingleton((i) => LocalRepository()),
//  Bind.lazySingleton((i) => ApiRepository()), // Caso receba dados de uma api invés de um json local, é só substituir pela implementação

  ];

 @override
 final List<ModularRoute> routes = [
   ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
 ];
}