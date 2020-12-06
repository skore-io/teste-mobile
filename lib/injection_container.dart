import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:minhas_aulas/core/services/network/network_info.dart';
import 'package:minhas_aulas/features/class/data/datasources/class_remote_datasource.dart';
import 'package:minhas_aulas/features/class/data/repositories/class_repository.dart';
import 'package:minhas_aulas/features/class/domain/repositories/class_repository.dart';
import 'package:minhas_aulas/features/class/domain/usecases/get_classes.dart';
import 'package:minhas_aulas/features/class/presentation/store/class_store.dart';

final serviceLocator = GetIt.instance;

void init() {
  //* core
  serviceLocator.registerLazySingleton(() => DataConnectionChecker());
  serviceLocator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      serviceLocator(),
    ),
  );

  //* Domain
  serviceLocator.registerLazySingleton(
    () => GetClasses(
      serviceLocator(),
    ),
  );
  //* Data
  serviceLocator.registerLazySingleton<ClassRemoteDataSource>(
    () => ClassRemoteDataSourceImpl(),
  );
  serviceLocator.registerLazySingleton<ClassRepository>(
    () => ClassRepositoryImpl(
      networkInfo: serviceLocator(),
      remoteDataSource: serviceLocator(),
    ),
  );

  //* Presentation
  serviceLocator.registerLazySingleton<ClassStore>(
    () => ClassStore(
      getClasses: serviceLocator(),
    ),
  );
}
