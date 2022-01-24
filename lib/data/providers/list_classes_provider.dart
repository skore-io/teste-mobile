import '../../domain/providers/interface_list_classes_provider.dart';
import '../datasources/repositories/classes_repository.dart';
import '../dtos/class_dto.dart';

class ListClassesProvider implements IListClassesProvider {
  ListClassesProvider(this._repository);

  final IClassesRepository _repository;

  @override
  Future<List<ClassDto>?> call() async {
    return await _repository.getlistClasses();
  }
}
