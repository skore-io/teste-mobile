import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:mobileteste/app/modules/home/presenter/controllers/home_controller.dart';

import 'widgets/list_tile_custom.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Observer(
          builder: (_) => controller.todoClass.isNotEmpty
              ? ListView.builder(
                  itemCount: controller.todoClass.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTileCustom(index: index);
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(),
                )),
    ));
  }
}
