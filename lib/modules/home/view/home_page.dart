import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_mobile/model/class_model.dart';
import 'package:teste_mobile/modules/home/home_controller.dart';
import 'package:teste_mobile/modules/home/home_utils.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeController homeController = HomeController();
  List<Class> classes = [];

  Future<void> fetchData() async {
    final classesData = homeController.fetchData();
    setState(() {
      classes = classesData;
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ...HomeUtils.classesList(classes),
          ],
        ),
      ),
    );
  }
}
