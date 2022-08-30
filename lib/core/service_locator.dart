import 'package:get_it/get_it.dart';
import 'package:skore_mobile_challenge/data/data_sources/lesson_data_source.dart';
import 'package:skore_mobile_challenge/data/repositories/lesson_repository_impl.dart';
import 'package:skore_mobile_challenge/domain/usecases/load_lesson_list.dart';
import 'package:skore_mobile_challenge/domain/usecases/remove_lesson.dart';

var locator = GetIt.instance;

Future<void> setupDependencies() async {
  // Use cases
  locator.registerLazySingleton(() => RemoveLessonUseCase(repository: locator()));
  locator.registerLazySingleton(() => LoadLessonListUseCase(repository: locator()));

  // Repository
  locator.registerLazySingleton(() => LessonRepositoryImpl(dataSource: locator()));

  // Data sources
  locator.registerLazySingleton<LessonDataSource>(() => LessonDataSourceImpl());
}
