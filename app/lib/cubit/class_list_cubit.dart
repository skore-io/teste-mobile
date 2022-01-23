import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../data/bundle.dart';
import '../model/class_item_model.dart';
import 'class_list_state.dart';

/// {@template class_list_cubit}
/// Control the home page class list state.
///
/// Takes a [Bundle] for tests.
/// {@endtemplate}
class ClassListCubit extends Cubit<ClassListState> {
  //// {@macro class_list_cubit}
  ClassListCubit({
    @visibleForTesting Bundle? bundle,
  })  : _bundle = bundle ?? Bundle(),
        super(ClassListState.loading());

  final Bundle _bundle;

  Future<void> loadList() async {
    try {
      final jsonList = await _bundle.loadFrom<List<dynamic>>(
        fileURL: 'data.json',
      );

      final classes = ClassItemModel.fromMapList(jsonList)
        ..sort(
          (a, b) {
            if (a == null || b == null) {
              return 0;
            }
            return b.createdAt.compareTo(a.createdAt);
          },
        );

      emit(ClassListState.fetched(classes: classes));
    } on Exception {
      emit(ClassListState.error());
    }
  }

  void deleteItem({required String id}) {
    final currentItem = state.classes.firstWhere((e) => e?.id == id)!;
    final currentIndex = state.classes.indexWhere((e) => e?.id == id);

    final newItem = currentItem.copyWith(status: ClassStatus.deleted);
    final newList = [...state.classes];
    newList[currentIndex] = newItem;

    emit(ClassListState.deletedItem(classes: newList));
  }
}
