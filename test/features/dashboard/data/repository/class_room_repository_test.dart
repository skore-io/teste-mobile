import 'package:flutter_test/flutter_test.dart';
import 'package:teste_mobile/features/dashboard/data/datasource/class_room_datasource.dart';
import 'package:teste_mobile/features/dashboard/data/repository/class_room_repository_impl.dart';
import 'package:teste_mobile/features/dashboard/domain/entities/list_class_room_entity.dart';

void main() {
  late ClassRoomDataSource dataSource;
  late ClassRoomRepositoryImpl repository;

  setUp(() {
    dataSource = ClassRoomDataSource();
    repository = ClassRoomRepositoryImpl(dataSource);
  });

  test('should return a ListClassRoomEntity', () async {
    final result = await repository.call();

    expect(result, isA<ListClassRoomEntity>());
  });
}
