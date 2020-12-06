import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minhas_aulas/core/error/exception.dart';
import 'package:minhas_aulas/core/error/failure.dart';
import 'package:minhas_aulas/core/services/network/network_info.dart';
import 'package:minhas_aulas/features/class/data/datasources/class_remote_datasource.dart';
import 'package:minhas_aulas/features/class/data/models/class_model.dart';
import 'package:minhas_aulas/features/class/data/repositories/class_repository.dart';
import 'package:minhas_aulas/features/class/domain/entities/class.dart';
import 'package:minhas_aulas/features/class/domain/repositories/class_repository.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDataSource extends Mock implements ClassRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  ClassRepository repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();

    repository = ClassRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      // this setUp applies only to the 'device is online' group
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group('getClasses', () {
    final tClassListModel = [
      ClassModel(
          companyId: "114",
          createdAt: 1571323199864,
          name: "Aula Álgebra",
          id: "114_0v62DokeArxPA9oDSBst_349785",
          status: ClassStatus.inProgress,
          summary: ClassSummaryModel(percentage: 20)),
      ClassModel(
          companyId: "114",
          createdAt: 1578343188529,
          name: "Aula Trigonometria",
          id: "114_3Lj7okST2yBSYXUUByg2_349798",
          status: ClassStatus.notStarted,
          summary: ClassSummaryModel(percentage: 0)),
      ClassModel(
          companyId: "114",
          createdAt: 1568918240759,
          name: "Aula Filosofia",
          id: "114_3O81FOuWLZIlSDnRJHm1_349798",
          status: ClassStatus.completed,
          summary: ClassSummaryModel(percentage: 100)),
      ClassModel(
          companyId: "114",
          createdAt: 1574361972593,
          name: "Aula Geografia",
          id: "114_46keopvfEUvlNP7bd049_349798",
          status: ClassStatus.inProgress,
          summary: ClassSummaryModel(percentage: 75)),
      ClassModel(
          companyId: "114",
          createdAt: 1571946887159,
          name: "Aula História",
          id: "114_5FK4ExJCz3vW4XmS0KVr_349798",
          status: ClassStatus.notStarted,
          summary: ClassSummaryModel(percentage: 0))
    ];
    test('should check if the device is online', () {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repository.getClasses();
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      test(
          'should return remote data when the call to remote data source is successful',
          () async {
        // arrange
        when(
          mockRemoteDataSource.getClasses(),
        ).thenAnswer((_) async => tClassListModel);
        // act
        final result = await repository.getClasses();
        // assert
        verify(mockRemoteDataSource.getClasses());
        expect(result, equals(Right<Failure, List<Class>>(tClassListModel)));
      });

      test(
          'should return server failure when the call to remote data source is unsuccessful',
          () async {
        // arrange
        when(
          mockRemoteDataSource.getClasses(),
        ).thenThrow(ServerException());
        // act
        final result = await repository.getClasses();
        // assert
        verify(mockRemoteDataSource.getClasses());
        expect(result, equals(Left<Failure, List<Class>>(ServerFailure())));
      });

      test(
          'should return server failure with message if Exception has one when the call to remote data source is unsuccessful',
          () async {
        // arrange
        when(
          mockRemoteDataSource.getClasses(),
        ).thenThrow(ServerException(message: 'message'));
        // act
        final result = await repository.getClasses();
        // assert
        verify(mockRemoteDataSource.getClasses());
        expect(
            result,
            equals(
                Left<Failure, List<Class>>(ServerFailure(message: 'message'))));
      });
    });

    runTestsOffline(() {
      test(
          'should return connection failure when call to remote data without connection',
          () async {
        // act
        final result = await repository.getClasses();
        // assert
        expect(result, equals(Left<Failure, List<Class>>(ConnectionFailure())));
      });
    });
  });
}
