import '../../providers/interface_list_classes_provider.dart';
import '../../models/class_model.dart';

abstract class IListClassesUsecase {
  Future<List<ClassModel>?> call();
}

class ListClassesUsecase implements IListClassesUsecase {
  ListClassesUsecase(this._provider);

  final IListClassesProvider _provider;

  @override
  Future<List<ClassModel>?> call() async {
    return await _provider();
  }
}
