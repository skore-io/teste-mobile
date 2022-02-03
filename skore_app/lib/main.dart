import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skore_app/controllers/subjects_manager.dart';
import 'package:skore_app/ui/pages/home/home_page.dart';
import 'package:skore_app/ui/pages/splash/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SubjectsManager>(
          create: (_) => SubjectsManager(),
          lazy: true,
        ),
      ],
    child: MaterialApp(
      title: 'Skore App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) {
          switch (settings.name) {
            case "/splash":
              return MaterialPageRoute(builder: (_) => SplashPage());
            case "/home":
              return MaterialPageRoute(builder: (_) => HomePage());
            default:
              return MaterialPageRoute(builder: (_) => SplashPage());
          }
        },

        initialRoute: "/splash",
    ),);
  }
}
