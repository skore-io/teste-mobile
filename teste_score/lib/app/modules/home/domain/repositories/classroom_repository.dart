import 'package:teste_score/app/either/types/either.dart';
import 'package:teste_score/app/modules/home/domain/entities/classroom.dart';
import 'package:teste_score/app/modules/home/exceptions/classroom_exception.dart';

abstract class IClassRoomRepository {
  Future<Either<IClassRoomException, List<ClassRoom>>> getClassRoom();
}
