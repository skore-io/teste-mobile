import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:skore/domain/models/lesson_model.dart';
part 'lessons_store.g.dart';

@singleton
class LessonsStore = _LessonsStoreBase with _$LessonsStore;

abstract class _LessonsStoreBase with Store {
  @observable
  List<LessonModel> lessonsList = [];
}
