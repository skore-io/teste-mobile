import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl_standalone.dart';
import 'package:teste_score/app/app_module.dart';
import 'package:teste_score/app/app_widget.dart';

Future<void> main() async {
  await initializeDateFormatting(await findSystemLocale(), '');

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
