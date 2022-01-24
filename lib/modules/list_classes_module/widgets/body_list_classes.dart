import 'package:flutter/material.dart';

import '../../../domain/models/class_model.dart';
import '../../components/class_list_tile.dart';
import '../list_classes_controller.dart';

class BodyListClasses extends StatelessWidget {
  final _controller = ListClassesController.find;

  BodyListClasses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_controller.isLoading) return Container();
    return classesList(
      _controller.allClasses,
      _controller.deleteClass,
    );
  }

  Widget classesList(
      List<ClassModel> classes, void Function(String id) onDelete) {
    if (classes.isEmpty) return Container();

    return Container(
      padding: const EdgeInsets.only(top: 20.0),
      child: ListView.builder(
        itemCount: classes.length,
        itemBuilder: (_, index) {
          ClassModel oneClass = classes[index];
          return ClassListTile(
            oneClass: oneClass,
            onDelete: () => onDelete(oneClass.id),
          );
        },
      ),
    );
  }
}
