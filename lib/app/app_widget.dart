import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;

import 'core/utils/theme/theme_data_custom.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Teste',
      debugShowCheckedModeBanner: false,
      builder: asuka.builder,
      theme: ThemeDataCustom().theme,
    ).modular();
  }
}
