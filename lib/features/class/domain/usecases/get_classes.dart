import 'package:equatable/equatable.dart';
import 'package:minhas_aulas/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:minhas_aulas/core/usecases/usecase.dart';
import 'package:minhas_aulas/features/class/domain/entities/class.dart';
import 'package:minhas_aulas/features/class/domain/repositories/class_repository.dart';

class GetClasses extends UseCase<List<Class>, NoParams> {
  GetClasses(this.repository);
  final ClassRepository repository;
  @override
  Future<Either<Failure, List<Class>>> call(NoParams params) {
    return repository.getClasses();
  }
}
