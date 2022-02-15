import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/utils/theme/theme_data_custom.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Teste',
      debugShowCheckedModeBanner: false,
      theme: ThemeDataCustom().theme,
    ).modular();
  }
}
