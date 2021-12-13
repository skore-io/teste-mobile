import 'package:skore/domain/errors/base_error.dart';

class FetchLessonsError implements BaseError {
  @override
  String message;

  FetchLessonsError({
    required this.message,
  });

  @override
  StackTrace? get stackTrace => throw FetchLessonsError(message: 'Falha ao ');
}
