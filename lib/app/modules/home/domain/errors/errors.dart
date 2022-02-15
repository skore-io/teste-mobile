import 'package:mobileteste/app/core/errors/errors.dart';

class GetAllClassFromListError implements Failure {
  @override
  String? message;
  GetAllClassFromListError({
    this.message,
  });
}

class GetAllClassListEmptyError implements Failure {
  @override
  String? message;
  GetAllClassListEmptyError({this.message});
}
