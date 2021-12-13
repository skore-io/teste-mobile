import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:skore/core/widgets/loader/loader_widget.dart';
import 'package:skore/core/widgets/tiles/lesson_tile_widget.dart';
import 'package:skore/core/widgets/widget_state/widget_state.dart';
import 'package:skore/ui/pages/home/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends WidgetState<HomePage, HomePageController> {
  TextStyle get titleStyle => const TextStyle(color: Colors.purple);

  @override
  void initState() {
    controller.fetchAllLessons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Skore App', style: titleStyle),
      ),
      body: Observer(builder: (_) {
        if (controller.lessonsList == null) {
          return const LoaderWidget();
        }

        if (controller.lessonsList!.isEmpty) {
          return const Center(child: Text('Nenhuma aula encontrada'));
        }

        return ListView.builder(
            itemCount: controller.lessonsList!.length,
            itemBuilder: (context, index) {
              final lessonModel = controller.lessonsList![index];

              return LessonTileWidget(
                lessonModel: lessonModel,
                onDelete: () => controller.deleteLesson(lessonModel.id!),
              );
            });
      }),
    );
  }
}
