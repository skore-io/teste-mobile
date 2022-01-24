import "../../data/dtos/class_dto.dart";

abstract class IListClassesProvider {
  Future<List<ClassDto>?> call();
}