import 'package:dartz/dartz.dart';
import 'package:minhas_aulas/core/error/failure.dart';
import 'package:minhas_aulas/features/class/domain/entities/class.dart';

abstract class ClassRepository {
  Future<Either<Failure, List<Class>>> getClasses();
}
