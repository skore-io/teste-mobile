import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable implements Exception {}

class InternalFailure extends Failure {
  final String message;

  InternalFailure({required this.message});

  @override
  List<Object?> get props => [message];

  @override
  String toString() => 'InternalFailure: $message';
}
