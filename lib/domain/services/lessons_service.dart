import 'package:injectable/injectable.dart';
import 'package:skore/core/helpers/list_helpder.dart';
import 'package:skore/data/repositories/lessons_repository.dart';
import 'package:skore/domain/errors/lesson_errors.dart';
import 'package:skore/domain/models/lesson_model.dart';
import 'package:skore/domain/transients/lessons_store.dart';

abstract class ILessonsService {
  Future<List<LessonModel>> fetchAll();

  Future<List<LessonModel>> deleteLesson(String id);
}

@Injectable(as: ILessonsService)
class LessonsService implements ILessonsService {
  final ILessonsRepository lessonRepository;
  final LessonsStore lessonsStore;

  LessonsService({
    required this.lessonRepository,
    required this.lessonsStore,
  });

  @override
  Future<List<LessonModel>> fetchAll() async {
    try {
      final lessonsList = await lessonRepository.fetchAllLessons();
      lessonsStore.lessonsList = lessonsList;
      return ListHelper.sortByDate(lessonsList);
    } catch (_) {
      throw FetchLessonsError(message: 'Falha ao carregar as aulas.');
    }
  }

  @override
  Future<List<LessonModel>> deleteLesson(String id) async {
    try {
      final lessonsList = await lessonRepository.deleteLesson(id);
      return ListHelper.sortByDate(lessonsList);
    } catch (_) {
      throw FetchLessonsError(message: 'Falha ao deletar a aula.');
    }
  }
}
