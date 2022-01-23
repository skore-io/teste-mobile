import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_mobile/cubit/class_list_cubit.dart';
import 'package:teste_mobile/cubit/class_list_state.dart';
import 'package:teste_mobile/data/bundle.dart';
import 'package:teste_mobile/model/class_item_model.dart';

class _MockBundle extends Mock implements Bundle {}

void main() {
  late Bundle bundle;
  late ClassListCubit cubit;

  setUp(() {
    bundle = _MockBundle();
    cubit = ClassListCubit(
      bundle: bundle,
    );
  });

  final classes = [
    // The newest first
    ClassItemModel(
      id: '114_3Lj7okST2yBSYXUUByg2_349798',
      status: ClassStatus.notStated,
      name: 'Aula Trigonometria',
      companyId: '114',
      createdAt: DateTime.fromMillisecondsSinceEpoch(1578343188529),
      percentage: null,
    ),
    ClassItemModel(
      id: '114_0v62DokeArxPA9oDSBst_349785',
      status: ClassStatus.inProgress,
      name: 'Aula Álgebra',
      companyId: '114',
      createdAt: DateTime.fromMillisecondsSinceEpoch(1571323199864),
      percentage: 20,
    ),
  ];

  group('loadList()', () {
    blocTest<ClassListCubit, ClassListState>(
      'Success case when fetch a json list',
      build: () => cubit,
      setUp: () {
        when<Future<List<dynamic>>>(
          () => bundle.loadFrom(
            fileURL: any(named: 'fileURL'),
          ),
        ).thenAnswer(
          (_) => Future.value(
            json.decode(_jsonInString),
          ),
        );
      },
      act: (cubit) => cubit.loadList(),
      expect: () => [
        ClassListState.fetched(classes: classes),
      ],
    );

    blocTest<ClassListCubit, ClassListState>(
      'Error case when bundle throw a Exception',
      build: () => cubit,
      setUp: () {
        when<Future<List<dynamic>>>(
          () => bundle.loadFrom(
            fileURL: any(named: 'fileURL'),
          ),
        ).thenThrow(
          Exception(),
        );
      },
      act: (cubit) => cubit.loadList(),
      expect: () => [
        ClassListState.error(),
      ],
    );
  });

  final classesWithItemDeleted = [
    ClassItemModel(
      id: '114_3Lj7okST2yBSYXUUByg2_349798',
      status: ClassStatus.deleted,
      name: 'Aula Trigonometria',
      companyId: '114',
      createdAt: DateTime.fromMillisecondsSinceEpoch(1578343188529),
      percentage: null,
    ),
    ClassItemModel(
      id: '114_0v62DokeArxPA9oDSBst_349785',
      status: ClassStatus.inProgress,
      name: 'Aula Álgebra',
      companyId: '114',
      createdAt: DateTime.fromMillisecondsSinceEpoch(1571323199864),
      percentage: 20,
    ),
  ];

  group('deleteItem', () {
    blocTest<ClassListCubit, ClassListState>(
      'When call deleteItem should change the item status',
      build: () => cubit,
      seed: () => ClassListState.fetched(classes: classes),
      act: (cubit) => cubit.deleteItem(id: classes.first.id),
      expect: () => [
        ClassListState.deletedItem(classes: classesWithItemDeleted),
      ],
    );
  });
}

const _jsonInString =
    '[{"company_id": "114","created_at": 1571323199864,"name": "Aula Álgebra","id": "114_0v62DokeArxPA9oDSBst_349785","status": "IN_PROGRESS","summary": {"percentage": 20}},{"company_id": "114","created_at": 1578343188529,"name": "Aula Trigonometria","id": "114_3Lj7okST2yBSYXUUByg2_349798","status": "NOT_STARTED","summary": {"percentage": null}}]';
