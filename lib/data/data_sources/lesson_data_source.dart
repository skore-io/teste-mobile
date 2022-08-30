import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:skore_mobile_challenge/core/error/exceptions.dart';

abstract class LessonDataSource {
  Future<String> loadJsonFile();
}

class LessonDataSourceImpl implements LessonDataSource {
  LessonDataSourceImpl();

  @override
  Future<String> loadJsonFile() async {
    try {
      return await rootBundle.loadString('data/school.json');
    } catch (error, stackTrace) {
      log('Error while trying to load json file', error: error, stackTrace: stackTrace);
      throw const FileLoadException();
    }
  }
}
