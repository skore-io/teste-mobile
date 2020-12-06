import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:minhas_aulas/core/error/exception.dart';
import 'package:minhas_aulas/core/error/failure.dart';
import 'package:minhas_aulas/core/services/network/network_info.dart';
import 'package:minhas_aulas/features/class/data/datasources/class_remote_datasource.dart';
import 'package:minhas_aulas/features/class/domain/entities/class.dart';
import 'package:minhas_aulas/features/class/domain/repositories/class_repository.dart';

class ClassRepositoryImpl implements ClassRepository {
  ClassRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });
  final ClassRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  @override
  Future<Either<Failure, List<Class>>> getClasses() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getClasses());
      } on ServerException catch (e) {
        if (e.message != null)
          return Left(ServerFailure(message: e.message));
        else
          return Left(ServerFailure());
      } on EnumException catch (e) {
        if (e.message != null)
          return Left(EnumFailure(message: e.message));
        else
          return Left(EnumFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}
