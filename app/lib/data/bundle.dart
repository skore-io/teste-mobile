import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';

class Bundle {
  Bundle();

  Future<T> loadFrom<T>({required String fileURL}) async {
    try {
      final jsonString = await rootBundle.loadString(fileURL);
      final convertedObject = json.decode(jsonString) as T;

      return convertedObject;
    } on Exception catch (error, stackTrace) {
      log(
        runtimeType.toString(),
        error: error,
        stackTrace: stackTrace,
        level: 2000,
      );
      rethrow;
    }
  }
}
