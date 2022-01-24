import 'dart:developer';

import '../constants.dart';

abstract class Logger {
  void logInfo(dynamic data);
}

class RepositoryLogger implements Logger {
  @override
  void logInfo(data) {
    if (Constants.debugMode) {
      log(data);
    }
  }
}

class ControllerLogger implements Logger {
  @override
  void logInfo(data) {
    if (Constants.debugMode) {
      log(data);
    }
  }
}
