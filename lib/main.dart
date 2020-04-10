import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testemobileskore/pages/splash.dart';
import 'package:testemobileskore/util/resources.dart';

import 'bloc/aula.dart';

void main() {
  runApp(SkoreApp());
}

class SkoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AulaBloc>(
          create: (_) => AulaBloc(),
          dispose: (context, value) => value.dispose(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Skore by kaique.dev',
        theme: ThemeData(
          primarySwatch: Resources.customColorSwatch,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
