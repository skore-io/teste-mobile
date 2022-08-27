import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_score/app/modules/home/domain/repositories/classroom_repository.dart';
import 'package:teste_score/app/modules/home/domain/usecases/get_classroom_usecase.dart';
import 'package:teste_score/app/modules/home/external/datasources/classroom_datasource.dart';
import 'package:teste_score/app/modules/home/infra/datasources/classroom_datasource.dart';
import 'package:teste_score/app/modules/home/infra/repositories/classroom_repository.dart';
import 'package:teste_score/app/modules/home/presenter/controllers/classroom_controller.dart';
import 'package:teste_score/app/modules/home/presenter/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Module> imports = [];

  @override
  final List<Bind<Object>> binds = [
    //DATASOURCES
    Bind.factory<IClassRoomDataSource>(
      (i) => ClassRoomDataSource(),
    ),

    //REPOSITORIES
    Bind.factory<IClassRoomRepository>(
      (i) => ClassRoomRepository(
        dataSource: i(),
      ),
    ),

    //USECASES
    Bind.factory<IGetClassRoomUseCase>(
      (i) => GetClassRoomUseCase(
        repository: i(),
      ),
    ),

    //CONTROLLERS
    Bind.singleton<ClassRoomController>(
      (i) => ClassRoomController(
        useCase: i(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: ((context, args) => HomePage(
            controller: Modular.get<ClassRoomController>(),
          )),
    ),
  ];
}
