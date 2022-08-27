import 'package:teste_score/app/either/types/either.dart';
import 'package:teste_score/app/modules/home/domain/entities/classroom.dart';
import 'package:teste_score/app/modules/home/domain/repositories/classroom_repository.dart';
import 'package:teste_score/app/modules/home/exceptions/classroom_exception.dart';

abstract class IGetClassRoomUseCase {
  Future<Either<IClassRoomException, List<ClassRoom>>> call();
}

class GetClassRoomUseCase implements IGetClassRoomUseCase {
  final IClassRoomRepository repository;

  GetClassRoomUseCase({
    required this.repository,
  });

  @override
  Future<Either<IClassRoomException, List<ClassRoom>>> call() async {
    return repository.getClassRoom();
  }
}
