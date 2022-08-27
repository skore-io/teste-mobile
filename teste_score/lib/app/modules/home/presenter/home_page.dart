import 'dart:async';

import 'package:flutter/material.dart';
import 'package:teste_score/app/modules/home/presenter/controllers/classroom_controller.dart';
import 'package:teste_score/app/modules/home/presenter/controllers/events/classroom_events.dart';
import 'package:teste_score/app/modules/home/presenter/widgets/card_classroom_widget.dart';
import 'package:teste_score/app/theme/app_theme.dart';
import 'package:teste_score/app/utils/constants.dart';
import 'package:teste_score/app/utils/loading_widget.dart';

class HomePage extends StatefulWidget {
  final ClassRoomController controller;
  const HomePage({Key? key, required this.controller}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Stream<ClassRoomEvents> stream;

  Future<void> init() async {
    stream = widget.controller.getClassRoom();
  }

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Class Room',
          style: AppTheme.textStyles.titleAppBar,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: StreamBuilder<ClassRoomEvents>(
            stream: stream,
            builder: (context, snapshot) {
              final event = snapshot.data;

              if (event is ErrorEvent) {
                return Text(event.message);
              }

              if (event is! SuccessGetListEvent) {
                return ListView.separated(
                  itemBuilder: (context, index) => LoadingWidget(
                      size: Size(context.screenWidth, 40), radius: 10),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: 10,
                );
              }

              if (event.classRoom.isEmpty) {
                return SizedBox(
                  height: context.screenHeight,
                  width: context.screenWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Nenhuma aula encontrada',
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          stream = widget.controller.getClassRoom();
                          setState(() {});
                        },
                        child: const Text('Buscar novamente'),
                      )
                    ],
                  ),
                );
              }

              return ListView.separated(
                itemBuilder: (context, index) {
                  return CardClassRoomWidget(
                    classRoom: event.classRoom[index],
                    index: index,
                    removeClassRoom: () {
                      event.classRoom.removeAt(index);
                      setState(() {});
                    },
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: event.classRoom.length,
              );
            }),
      ),
    );
  }
}
