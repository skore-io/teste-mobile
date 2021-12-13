import 'package:skore/domain/models/lesson_model.dart';

class ListHelper {
  static List<LessonModel> sortByDate(List<LessonModel> lessonsList) {
    return lessonsList
      ..sort((a, b) {
        var adate = a.createdAt;
        var bdate = b.createdAt;
        return adate.compareTo(bdate);
      });
  }
}
