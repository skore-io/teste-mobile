import 'package:teste_score/app/either/types/either.dart';
import 'package:teste_score/app/modules/home/domain/entities/classroom.dart';
import 'package:teste_score/app/modules/home/domain/repositories/classroom_repository.dart';
import 'package:teste_score/app/modules/home/exceptions/classroom_exception.dart';
import 'package:teste_score/app/modules/home/infra/adapters/classroom_adapter.dart';
import 'package:teste_score/app/modules/home/infra/datasources/classroom_datasource.dart';

class ClassRoomRepository implements IClassRoomRepository {
  final IClassRoomDataSource dataSource;

  ClassRoomRepository({
    required this.dataSource,
  });

  @override
  Future<Either<IClassRoomException, List<ClassRoom>>> getClassRoom() async {
    try {
      final result = await dataSource.getClassRoom();

      final List<ClassRoom> classRoom = [];

      classRoom.addAll(result.map(ClassRoomAdapter.fromMap));

      classRoom.sort((a, b) => b.createdAt.compareTo(a.createdAt));

      return right(classRoom);
    } on IClassRoomException catch (e) {
      return left(ClassRoomException(message: e.message));
    } catch (e) {
      return left(ClassRoomException(message: e.toString()));
    }
  }
}
