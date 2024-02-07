import 'package:flutter/material.dart';
import 'package:teste_mobile/app/app.dart';
import 'package:teste_mobile/app/controller.dart';

Future main() async {
  Controller controller = Controller();
  await controller();
  runApp(App(controller: controller));
}
