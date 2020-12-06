import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class ServerFailure extends Failure {
  ServerFailure({this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

class EnumFailure extends Failure {
  EnumFailure({this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

class ConnectionFailure extends Failure {
  ConnectionFailure();

  @override
  List<Object> get props => [];
}
