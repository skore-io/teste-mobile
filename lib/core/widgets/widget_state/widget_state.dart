import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:skore/config/injection/app_injection.dart';

abstract class WidgetState<Widget extends StatefulWidget, Controller extends Store> extends State<Widget> {
  final Controller controller = getIt<Controller>();
}
