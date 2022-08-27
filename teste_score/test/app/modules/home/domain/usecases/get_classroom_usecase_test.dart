import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_score/app/either/types/either.dart';
import 'package:teste_score/app/modules/home/domain/entities/classroom.dart';
import 'package:teste_score/app/modules/home/domain/repositories/classroom_repository.dart';
import 'package:teste_score/app/modules/home/domain/usecases/get_classroom_usecase.dart';

class ClassRoomRepositoryMock extends Mock implements IClassRoomRepository {}

void main() {
  late IClassRoomRepository repository;
  late GetClassRoomUseCase useCase;

  setUp(() {
    repository = ClassRoomRepositoryMock();
    useCase = GetClassRoomUseCase(repository: repository);
  });

  test('should return a list of ClassRoom entity', () async {
    when(
      () => repository.getClassRoom(),
    ).thenAnswer((_) async => right(<ClassRoom>[]));

    final result = await useCase();

    expect(result.fold(id, id), isA<List<ClassRoom>>());
  });
}
