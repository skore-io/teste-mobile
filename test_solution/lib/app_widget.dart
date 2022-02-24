import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_solution/data/datasources/local/disciplines_local_datasource.dart';
import 'package:test_solution/data/repositories/local/disciplines_local_repository.dart';
import 'package:test_solution/presenter/controllers/home/home_store.dart';
import 'presenter/screens/home_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) =>
              DisciplinesLocalDatasource('assets/data/disciplines.json'),
        ),
        Provider(
          create: (context) => DisciplinesLocalRepository(context.read()),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeStore(context.read()),
        ),
      ],
      child: MaterialApp(
        title: 'Solução - Teste Mobile',
        theme: ThemeData(brightness: Brightness.dark),
        home: const HomeScreen(),
      ),
    );
  }
}
