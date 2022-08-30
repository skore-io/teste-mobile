import 'package:skore_mobile_challenge/core/usecase.dart';
import 'package:skore_mobile_challenge/domain/models/lesson.dart';
import 'package:skore_mobile_challenge/domain/repositories/lesson_repository.dart';

class LoadLessonListUseCase implements UseCase<List<Lesson>, NoParams> {
  final LessonRepository repository;

  LoadLessonListUseCase({required this.repository});

  @override
  Future<List<Lesson>> call(NoParams noParams) async {
    return await repository.getLessonList();
  }
}
