import 'package:flutter/material.dart';
import 'package:test_solution/data/models/class_model.dart';
import 'package:test_solution/presenter/widgets/list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var classMockup = const ClassModel(
      companyId: "114",
      createdAt: 1571323199864,
      name: "Aula Álgebra",
      id: "114_0v62DokeArxPA9oDSBst_349785",
      status: "IN_PROGRESS",
      summary: {"percentage": 20});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solução - Teste Mobile'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListItem(classMockup, index);
        },
      ),
    );
  }
}
