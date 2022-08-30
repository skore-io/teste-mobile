import 'package:flutter/material.dart';
import 'package:skore_mobile_challenge/presentation/screens/lesson_list/lesson_list.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blue,
      ),
      body: const Center(child: LessonList()),
    );
  }
}
