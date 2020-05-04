import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:marcelo_esser_test/dao/lessons_dao.dart';
import 'package:marcelo_esser_test/http/services/lessons_services.dart';
import 'package:marcelo_esser_test/model/lesson.dart';

class LessonsBloc implements BlocBase {
  final LessonsWebClient webClient;
  final LessonsDao dao;

  List<Lesson> _savedLessons = List();
  List<Lesson> _apiLessons = List();

  LessonsBloc({@required this.webClient, @required this.dao});

  StreamController<List<Lesson>> _lessonsController =
      StreamController<List<Lesson>>();

  Stream<List<Lesson>> get outLessons => _lessonsController.stream;

  Sink<List<Lesson>> get inLessons => _lessonsController.sink;

  @override
  void addListener(listener) {
    _lessonsController.onListen = listener;
  }

  @override
  void dispose() {
    _lessonsController.close();
  }

  @override
  bool get hasListeners => _lessonsController.hasListener;

  @override
  void notifyListeners() {}

  @override
  void removeListener(listener) {
    if (_lessonsController.hasListener) {
      _lessonsController.onCancel = listener;
    }
  }

  void getAndSaveAllLessons() async {
    _apiLessons = await webClient.getAllLessons();
    _savedLessons = await dao.findAll();

    if (_hasLessons()) {
      _apiLessons.sort((a, b) => a.createdAt.compareTo(b.createdAt));

      for (Lesson lesson in _apiLessons) {
        if (!_hasThisLesson(lesson)) {
          await dao.saveLesson(lesson);
        }
      }
    }

    inLessons.add(await dao.findAll());
  }

  bool _hasLessons() => _apiLessons != null && _apiLessons.length > 0;

  void delete(String id) async {
    await dao.deleteLessonBy(id: id);
    inLessons.add(await dao.findAll());
  }

  bool _hasThisLesson(Lesson lesson) {
    for (Lesson mLesson in _savedLessons) {
      if (mLesson.id == lesson.id) {
        return true;
      }
    }
    return false;
  }
}
