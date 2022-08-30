import 'package:skore_mobile_challenge/core/usecase.dart';
import 'package:skore_mobile_challenge/domain/models/lesson.dart';
import 'package:equatable/equatable.dart';
import 'package:skore_mobile_challenge/domain/repositories/lesson_repository.dart';

class RemoveLessonUseCase implements UseCase<Lesson, LessonRequestParams> {
  final LessonRepository repository;

  RemoveLessonUseCase({required this.repository});

  @override
  Future<Lesson> call(LessonRequestParams params) async {
    return await repository.removeLesson(params.id);
  }
}

class LessonRequestParams extends Equatable {
  final String id;

  const LessonRequestParams({required this.id});

  @override
  List<Object> get props => [id];
}
