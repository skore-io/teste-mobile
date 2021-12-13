import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:skore/core/bases/base_controller.dart';
import 'package:skore/domain/models/lesson_model.dart';

import 'package:skore/domain/services/lessons_service.dart';

part 'home_page_controller.g.dart';

@injectable
class HomePageController = _HomePageControllerBase with _$HomePageController;

abstract class _HomePageControllerBase extends BaseController with Store {
  ILessonsService lessonsService;

  @observable
  List<LessonModel>? lessonsList;

  _HomePageControllerBase({
    required this.lessonsService,
  });

  @action
  Future<void> fetchAllLessons() async {
    final result = await runAsyncAction<List<LessonModel>>(
      () => lessonsService.fetchAll(),
    ).onError(
      (error, stackTrace) => [],
    );

    lessonsList = result;
  }

  @action
  Future<void> deleteLesson(String id) async {
    lessonsList = null;
    final result = await runAsyncAction<List<LessonModel>>(
      () => lessonsService.deleteLesson(id),
    ).onError(
      (error, stackTrace) => [],
    );

    lessonsList = result;
  }
}
