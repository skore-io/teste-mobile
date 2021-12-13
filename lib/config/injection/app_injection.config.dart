// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/repositories/lessons_repository.dart' as _i4;
import '../../domain/services/lessons_service.dart' as _i5;
import '../../domain/transients/lessons_store.dart' as _i3;
import '../../ui/pages/home/home_page_controller.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.LessonsStore>(_i3.LessonsStore());
  gh.factory<_i4.ILessonsRepository>(
      () => _i4.LessonsRepositoryImpl(lessonsStore: get<_i3.LessonsStore>()));
  gh.factory<_i5.ILessonsService>(() => _i5.LessonsService(
      lessonRepository: get<_i4.ILessonsRepository>(),
      lessonsStore: get<_i3.LessonsStore>()));
  gh.factory<_i6.HomePageController>(
      () => _i6.HomePageController(lessonsService: get<_i5.ILessonsService>()));
  return get;
}
