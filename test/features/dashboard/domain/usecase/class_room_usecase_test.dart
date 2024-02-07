import 'package:flutter_test/flutter_test.dart';
import 'package:teste_mobile/features/dashboard/domain/usecase/class_room_usecase.dart';
import 'package:teste_mobile/features/dashboard/domain/repository/class_room_repository.dart';
import 'package:teste_mobile/features/dashboard/domain/entities/list_class_room_entity.dart';

class MockClassRoomRepository implements ClassRoomRepository {
  @override
  Future<ListClassRoomEntity> call() async {
    return ListClassRoomEntity([]);
  }
}

void main() {
  late ClassRoomUseCase usecase;

  setUp(() {
    final repository = MockClassRoomRepository();
    usecase = ClassRoomUseCaseImpl(repository);
  });

  group('ClassRoom UseCase', () {
    test('should return a ListClassRoomEntity', () async {
      final result = await usecase();

      expect(result, isA<ListClassRoomEntity>());
    });
  });
}
