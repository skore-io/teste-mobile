import 'package:flutter/material.dart';
import 'package:teste_score/app/utils/navigation_service.dart';

class MySnackBar {
  final String message;

  MySnackBar({
    required this.message,
  }) {
    _showSnackBar();
  }

  _showSnackBar() {
    late SnackBar snackBar = SnackBar(
      content: Text(message),
    );

    ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!)
        .showSnackBar(snackBar);
  }
}
