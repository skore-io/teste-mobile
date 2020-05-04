import 'package:flutter_test/flutter_test.dart';
import 'package:marcelo_esser_test/http/services/lessons_services.dart';
import 'package:marcelo_esser_test/model/lesson.dart';
import 'package:marcelo_esser_test/model/summary.dart';

void main() {
  test('Should validate the lessons json value', () {
    final Lesson lesson = Lesson("soijsafslidjf", 123123, "Name", "id",
        "Status", Summary(percentage: 20), 0);
    print(lesson.toJson());
    expect(lesson.id, "id");
  });

  test('Should validate de lessons size when finish the web service call',
      () async {
    final webClient = LessonsWebClient();
    final lessons = await webClient.getAllLessons();

    expect(lessons.length, 5);
  });

  test(
      'Should sort the lessons by create order when finish the web service call',
      () async {
    final webClient = LessonsWebClient();
    final lessons = await webClient.getAllLessons();

    lessons.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    expect(lessons[0].name, 'Aula Filosofia');
    expect(lessons[lessons.length - 1].name, "Aula Trigonometria");
  });
}
