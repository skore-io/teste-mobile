import 'package:flutter/cupertino.dart';
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
        appBar: AppBar(
          title: const Text('Lista de Aulas'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Observer(
              builder: (_) => controller.listTodoClass.isNotEmpty
                  ? ListView.builder(
                      itemCount: controller.listTodoClass.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTileCustom(index: index);
                      },
                    )
                  : const Center(
                      child: CupertinoActivityIndicator(
                      radius: 50,
                    ))),
        ));
  }
}
