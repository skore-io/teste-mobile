import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobileteste/app/core/utils/constants/mock_response_api.dart';
import 'package:mobileteste/app/modules/home/domain/usecases/get_all_class_from_list.dart';
import 'package:mobileteste/app/modules/home/infra/repositories/todo_repository_impl.dart';
import 'package:mobileteste/app/modules/home/presenter/controllers/home_controller.dart';
import 'package:mobileteste/app/modules/home/presenter/ui/home_page.dart';

import 'external/datasources/locale_datasource_impl.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => LocaleDataSourceImplementation(MockResponseApi())),
        Bind((i) => TodoRepositoryImpl(i())),
        Bind((i) => GetAllClassFromListImpl(i())),
        Bind((i) => HomeController(i<GetAllClassFromListImpl>()),
            isSingleton: true),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const HomePage(),
          transition: TransitionType.fadeIn,
          duration: const Duration(seconds: 2),
        )
      ];
}
