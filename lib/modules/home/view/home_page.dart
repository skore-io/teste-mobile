import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_mobile/model/class_model.dart';
import 'package:teste_mobile/modules/home/home_controller.dart';
import 'package:teste_mobile/modules/home/home_functions.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeController homeController = HomeController();
  final HomeFunctions homeFunctions = HomeFunctions();

  List<Class> classes = [];
  bool deleting = false;

  void setDeleting() => setState(() => deleting = !deleting);

  Future<void> fetchData() async {
    final classesData = homeController.fetchData();
    setState(() {
      classes = homeFunctions.sortListByCreateAt(classesData);
    });
  }

  void deleteItem(Class item) {
    setState(() {
      classes = homeFunctions.deleteItem(classes, item);
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
        actions: [
          IconButton(onPressed: () => setDeleting(), icon: Icon(Icons.delete))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ...homeFunctions.classesList(classes, deleting, deleteItem),
            ],
          ),
        ),
      ),
    );
  }
}
