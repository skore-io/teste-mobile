import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skore_app/controllers/subjects_manager.dart';
import 'package:skore_app/ui/pages/add_subject/ui/add_subject_page.dart';
import 'package:skore_app/ui/pages/home/ui/home_page.dart';
import 'package:skore_app/ui/pages/splash/splash_page.dart';
import 'package:skore_app/ui/shared/const/c.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
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
      title: C.titleApp,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) {
          switch (settings.name) {
            case "/splash":
              return MaterialPageRoute(builder: (_) => const SplashPage());
            case "/home":
              return MaterialPageRoute(builder: (_) => const HomePage());
            case "/add-subject":
              return MaterialPageRoute(builder: (_) => const AddSubjectPage());
            default:
              return MaterialPageRoute(builder: (_) => const SplashPage());
          }
        },
        initialRoute: "/splash",
    ),);
  }
}
