import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:score_cursos/app/common/utils/constants.dart';
import 'package:score_cursos/app/modules/home/domain/entities/course.entity.dart';

class CourseTile extends StatefulWidget {
  final CourseEntity? course;
  final Function onRemove;

  CourseTile({Key? key, required this.course, required this.onRemove}) : super(key: key);

  @override
  State<CourseTile> createState() => _CourseTileState();
}

class _CourseTileState extends State<CourseTile> {
  final pattern = DateFormat("dd/MM/yyyy", "pt_BR");
  late String? createData;

  @override
  void initState() {
    super.initState();
    createData = pattern.format(DateTime.fromMillisecondsSinceEpoch(widget.course!.createdAt!));
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 50,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(text: "Adiquirido em: ", style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold)),
                  TextSpan(text: createData, style: const TextStyle(color: Colors.grey, fontSize: 14)),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(text: "ID:", style: TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold)),
                  TextSpan(text: widget.course!.id, style: const TextStyle(color: Colors.grey, fontSize: 14)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Container(
                width: 100,
                height: 80,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.grey[200]),
                child: Center(
                  child: Icon(
                    LineAwesomeIcons.play,
                    color: primaryColor,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        widget.course!.name!,
                        style: TextStyle(color: accentColor, fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      LineInfo(icon: LineAwesomeIcons.globe, title: "Idioma", value: "Português/BR"),
                      LineInfo(icon: LineAwesomeIcons.play, title: "Duração", value: "30 horas")
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          _bottomOptionsAndProgress()
        ],
      ),
    );
  }

  Widget _bottomOptionsAndProgress() {
    if (widget.course!.status == Status.COMPLETED) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(LineAwesomeIcons.check_circle, color: Colors.green,),
          const SizedBox(width: 5,),
          OutlinedButton.icon(
              style: OutlinedButton.styleFrom(side: BorderSide(color: accentColor)),
              onPressed: () {},
              icon: Icon(
                LineAwesomeIcons.certificate,
                color: accentColor,
              ),
              label: Text(
                "Emitir Certificado",
                style: TextStyle(color: accentColor),
              )),
        ],
      );
    } else if (widget.course!.status == Status.IN_PROGRESS) {
      return Column(
        children: [
          LinearProgressIndicator(
            minHeight: 5,
            backgroundColor: accentColor.withOpacity(0.3),
            valueColor: AlwaysStoppedAnimation(accentColor),
            value: widget.course!.summary!.percentage! / 100,
          ),
          Align(
              alignment: Alignment.centerRight,
              child: Text("${widget.course!.summary!.percentage!}% concluído")),
          const SizedBox(
            height: 10,
          ),
          _removeButton()
        ],
      );
    }
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Você ainda não iniciou este curso",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        _removeButton()
      ],
    );
  }

  Widget _removeButton() => OutlinedButton.icon(
      style: OutlinedButton.styleFrom(side: const BorderSide(color: Colors.red)),
      onPressed: () async {
        bool sucess = await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => AlertDialog(title: Text("Tem certeza"), content: const Text("Sua matricula neste curso será cancelada."),
            actions: [
              TextButton(onPressed: ()=>Navigator.pop(context, true), child: const Text("Sim")),
              TextButton(onPressed: ()=>Navigator.pop(context, false), child: const Text("Não")),
            ],
            ),
            barrierColor: Colors.white70);
        if (sucess) {
          widget.onRemove();
        }
      },
      icon: const Icon(
        LineAwesomeIcons.trash,
        color: Colors.red,
      ),
      label: const Text(
        "Cancelar Curso",
        style: TextStyle(color: Colors.red),
      ));

  RichText LineInfo({IconData? icon, String? title, String? value, double fontSize=16}) => RichText(
        text: TextSpan(
          children: [
            WidgetSpan(
              child: Icon(icon, size: 18),
            ),
            TextSpan(text: title, style: TextStyle(color: Colors.grey, fontSize: fontSize, fontWeight: FontWeight.bold)),
            const WidgetSpan(child: SizedBox(width: 5)),
            TextSpan(text: value, style: TextStyle(color: Colors.grey, fontSize: fontSize)),
          ],
        ),
      );
}
