import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:teste_mobile/design_system/colors/ds_colors.dart';
import 'package:teste_mobile/features/dashboard/domain/entities/list_class_room_entity.dart';
import 'package:teste_mobile/presenter/dashboard/controllers/get_class_room_controller.dart';
import 'package:teste_mobile/share/util/date_util.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);
  static const routeName = '/dashboard_view';

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

final getClassRoomController = GetIt.I<GetClassRoomController>();

class _DashboardViewState extends State<DashboardView> {
  @override
  void initState() {
    getClassRoomController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('UOL EdTech', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: DSColors.white)),
        backgroundColor: DSColors.purple,
      ),
      body: ValueListenableBuilder<ListClassRoomEntity?>(
          valueListenable: getClassRoomController.classRoomListenable,
          builder: (context, snapshot, _) {
            final classRoomEntity = snapshot;

            if (classRoomEntity == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            classRoomEntity.listClassRoom.sort((a, b) => b.createdAt.compareTo(a.createdAt));

            if (classRoomEntity.listClassRoom.isEmpty) {
              return const Center(
                child: Text('Nenhuma aula disponível!'),
              );
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: classRoomEntity.listClassRoom.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textFormatted('NOME: ', classRoomEntity.listClassRoom[index].name),
                                  textFormatted('DATA: ', DateUtil.formatMillis(classRoomEntity.listClassRoom[index].createdAt)),
                                  textFormatted('ID: ', classRoomEntity.listClassRoom[index].id),
                                  const SizedBox(height: 8),
                                  Visibility(
                                    visible: classRoomEntity.listClassRoom[index].status == 'IN_PROGRESS',
                                    child: _buildProgressBar(classRoomEntity.listClassRoom[index].summary['percentage']),
                                  ),
                                ],
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Visibility(
                                    visible: classRoomEntity.listClassRoom[index].status == 'COMPLETED',
                                    child: const Icon(
                                      Icons.done,
                                      color: DSColors.green,
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {
                                      setState(() {
                                        getClassRoomController.removeRoom(index);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            );
          }),
    );
  }

  RichText textFormatted(String text, String listText) {
    return RichText(
        text: TextSpan(text: text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: DSColors.purple), children: <TextSpan>[
      TextSpan(
        text: listText,
        style: const TextStyle(fontSize: 14, color: DSColors.black),
      )
    ]));
  }

  Widget _buildProgressBar(int? percentage) {
    if (percentage != null) {
      return LinearProgressIndicator(
        value: percentage / 100,
        backgroundColor: DSColors.gray,
        valueColor: const AlwaysStoppedAnimation<Color>(DSColors.blue),
      );
    } else {
      return const LinearProgressIndicator(
        value: 0,
        backgroundColor: DSColors.gray,
      );
    }
  }
}
