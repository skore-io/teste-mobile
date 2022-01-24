import 'package:get/get.dart';

import '../../data/datasources/repositories/classes_repository.dart';
import '../../data/providers/list_classes_provider.dart';
import '../../domain/usecases/list_classes_usecase/list_classes_usecase.dart';
import 'list_classes_controller.dart';

class ListClassesBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      ListClassesController(
        ListClassesUsecase(
          ListClassesProvider(
            ClassesRepository(),
          ),
        ),
      ),
    );
  }
}