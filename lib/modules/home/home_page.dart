import 'package:flutter/material.dart';
import 'package:testeuol/core/app_colors.dart';
import 'package:testeuol/modules/home/widgets/aula_card.dart';

import 'home_controller.dart';
import 'home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getAulas();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
    controller.aulasNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return controller.state == HomeState.success
        ? Scaffold(
            appBar: AppBar(title: Text("Aulas")),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: controller.aulas!.length,
                itemBuilder: (context, index) {
                  return AulaCard(
                    aula: controller.aulas![index],
                    controller: controller,
                  );
                },
              ),
            ),
          )
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.black),
              ),
            ),
          );
  }
}
