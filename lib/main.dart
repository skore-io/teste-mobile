import 'package:flutter/material.dart';
import 'package:my_classes/views/class_page.dart';
import 'package:provider/provider.dart';

import 'controllers/class_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ClassController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const ClassPage(),
        // -- Se quiser incluir outras rodas, basta adicionar aqui e descomentar
        // routes: {
        //   AppRoutes.HOME: (context) => ProductsPage(),
        // },
      ),
    );
  }
}
