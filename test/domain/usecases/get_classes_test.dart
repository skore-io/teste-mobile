import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minhas_aulas/core/error/failure.dart';
import 'package:minhas_aulas/core/usecases/usecase.dart';
import 'package:minhas_aulas/features/class/domain/entities/class.dart';
import 'package:minhas_aulas/features/class/domain/repositories/class_repository.dart';
import 'package:minhas_aulas/features/class/domain/usecases/get_classes.dart';
import 'package:mockito/mockito.dart';

class MockClassRepository extends Mock implements ClassRepository {}

void main() {
  GetClasses usecase;
  MockClassRepository mockClassRepository;

  setUp(() {
    mockClassRepository = MockClassRepository();
    usecase = GetClasses(mockClassRepository);
  });

  final tClassList = [
    Class(
        companyId: "114",
        createdAt: 1571323199864,
        name: "Aula Álgebra",
        id: "114_0v62DokeArxPA9oDSBst_349785",
        status: ClassStatus.inProgress,
        summary: ClassSummary(percentage: 20)),
    Class(
        companyId: "114",
        createdAt: 1578343188529,
        name: "Aula Trigonometria",
        id: "114_3Lj7okST2yBSYXUUByg2_349798",
        status: ClassStatus.notStarted,
        summary: ClassSummary(percentage: 0)),
    Class(
        companyId: "114",
        createdAt: 1568918240759,
        name: "Aula Filosofia",
        id: "114_3O81FOuWLZIlSDnRJHm1_349798",
        status: ClassStatus.completed,
        summary: ClassSummary(percentage: 100)),
    Class(
        companyId: "114",
        createdAt: 1574361972593,
        name: "Aula Geografia",
        id: "114_46keopvfEUvlNP7bd049_349798",
        status: ClassStatus.inProgress,
        summary: ClassSummary(percentage: 75)),
    Class(
        companyId: "114",
        createdAt: 1571946887159,
        name: "Aula História",
        id: "114_5FK4ExJCz3vW4XmS0KVr_349798",
        status: ClassStatus.notStarted,
        summary: ClassSummary(percentage: 0))
  ];

  test('should retrieve the Class list from the repository', () async {
    when(
      mockClassRepository.getClasses(),
    ).thenAnswer((_) async => Right(tClassList));
    final result = await usecase(NoParams());

    expect(result, Right<Failure, List<Class>>(tClassList));
    verify(
      mockClassRepository.getClasses(),
    );

    verifyNoMoreInteractions(mockClassRepository);
  });
}
