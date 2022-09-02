import 'package:flutter/material.dart';
import 'package:my_classes/controllers/class_controller.dart';
import 'package:provider/provider.dart';

import 'components/content_class_component.dart';

class ClassPage extends StatefulWidget {
  const ClassPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  @override
  Widget build(BuildContext context) {
    ClassController controller = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas aulas'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: controller.itemsCount,
        itemBuilder: (context, i) => Column(
          children: [
            ContentClassComponent(
              controller.items[i],
            ),
          ],
        ),
      ),
    );
  }
}
