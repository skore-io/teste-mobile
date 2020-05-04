import 'dart:convert';

import 'package:http/http.dart';
import 'package:marcelo_esser_test/http/web_client.dart';
import 'package:marcelo_esser_test/model/lesson.dart';

class LessonsWebclient {
  Future<List<Lesson>> getAllLessons() async {
    final Response response = await client.get("$baseUrl/test");
    return toLessonList(response);
  }

  List<Lesson> toLessonList(Response response) {
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson.map((dynamic json) {
      return Lesson.fromJson(json);
    }).toList();
  }
}
