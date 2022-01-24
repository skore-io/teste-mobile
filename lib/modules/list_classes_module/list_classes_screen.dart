import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'list_classes_controller.dart';
import 'widgets/body_list_classes.dart';

class ListClassesScreen extends StatelessWidget {
  ListClassesScreen({Key? key}) : super(key: key);

  final _controller = ListClassesController.find;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder(
        init: _controller,
        builder: (_) => Scaffold(
          appBar: AppBar(
            key: Key("AppBarListClassesKey"),
            centerTitle: true,
            title: Text("Skore Test"),
            elevation: 2.0,
            actions: [
              IconButton(
                onPressed: _controller.refreshList,
                icon: Icon(
                  Icons.refresh_outlined,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.grey.shade100,
          body: BodyListClasses(
            key: Key("BodyListClassesKey"),
          ),
        ),
      ),
    );
  }
}
