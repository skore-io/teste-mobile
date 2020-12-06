import 'package:flutter_test/flutter_test.dart';
import 'package:minhas_aulas/features/class/data/datasources/class_remote_datasource.dart';
import 'package:minhas_aulas/features/class/data/models/class_model.dart';
import 'package:minhas_aulas/features/class/domain/entities/class.dart';

void main() {
  ClassRemoteDataSource dataSource;

  setUp(() {
    dataSource = ClassRemoteDataSourceImpl();
  });

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
    test(
        'should return Success Message when the response code is 200 (success)',
        () async {
      // arrange
      TestWidgetsFlutterBinding.ensureInitialized();
      // act
      final result = await dataSource.getClasses();
      // assert
      expect(result, tClassListModel);
    });
  });
}
