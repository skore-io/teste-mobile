import 'package:flutter/material.dart';
import 'package:my_classes/controllers/class_controller.dart';
import 'package:my_classes/models/class_model.dart';
import 'package:my_classes/theme/app_typography.dart';
import 'package:my_classes/views/components/text_component.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ContentClassComponent extends StatelessWidget {
  final ClassModel classModel;
  final SizedBox space = const SizedBox(height: 10);

  const ContentClassComponent(
    this.classModel, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    classModel.name!,
                    style: textScoupeStyle,
                  ),
                  InkWell(
                    child: Icon(
                      Icons.delete,
                      color: Theme.of(context).errorColor,
                    ),
                    onTap: () {
                      _dialogDelete(context);
                    },
                  ),
                ],
              ),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextComponent(
                        title: 'Status',
                        subtitle: classModel.status == 'NOT_STARTED'
                            ? 'Não iniciado'
                            : classModel.status == 'IN_PROGRESS'
                                ? 'Em andamento'
                                : 'Concluído',
                      ),
                      space,
                      Text(
                        'Progresso',
                        style: listTitleStyle,
                      ),
                      if ((classModel.summary!.percentage == null) ||
                          (classModel.summary!.percentage == 0))
                        Text(
                          '-',
                          style: listSubtitleStyle,
                        ),
                      if (classModel.summary!.percentage == 100)
                        const Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      if (classModel.summary!.percentage != null &&
                          classModel.summary!.percentage != 0 &&
                          classModel.summary!.percentage != 100)
                        Text(
                          '${classModel.summary!.percentage.toString()}%',
                          style: listSubtitleStyle,
                        ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextComponent(
                        title: 'Data de criação',
                        subtitle: DateFormat('dd/MM/yyyy').format(
                          DateTime.fromMillisecondsSinceEpoch(
                            classModel.createdAt!,
                          ),
                        ),
                      ),
                      space,
                      TextComponent(
                        title: 'Identificação da aula',
                        subtitle: classModel.companyId!,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _dialogDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Atenção',
              style: TextStyle(
                color: Theme.of(context).errorColor,
                fontSize: 20,
              ),
            ),
          ],
        ),
        content: Text(
          'Tem certeza que deseja\n excluir esta aula?',
          style: textStyle,
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            child: Text(
              'Não',
              style: textStyle,
            ),
            onPressed: () => Navigator.of(context).pop(false),
          ),
          TextButton(
            child: Text(
              'Sim',
              style: textStyle,
            ),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      ),
    ).then(
      (value) {
        if (value ?? false) {
          Provider.of<ClassController>(
            context,
            listen: false,
          ).removeClass(classModel);
        }
      },
    );
  }
}
