import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'cubit/class_list_cubit.dart';
import 'page/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp() : super(key: const Key('MyApp'));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: BlocProvider<ClassListCubit>(
        lazy: false,
        create: (_) => ClassListCubit()..loadList(),
        child: const HomePage(),
      ),
    );
  }
}
