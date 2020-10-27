import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:class_planner/bloc/class_bloc.dart';
import 'package:class_planner/model/class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final classesBloc = BlocProvider.getBloc<ClassBloc>();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  @override
  void initState() {
    classesBloc.loadClasses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Class Planner"),
          backgroundColor: Colors.grey[800],
        ),
        body: StreamBuilder<List<Class>>(
            stream: classesBloc.classes.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      order(),
                      Column(
                        children: snapshot.data.map((item) {
                          return Container(
                            margin: const EdgeInsets.all(4),
                            child: Card(
                              child: ListTile(
                                  title: Text(item.name),
                                  subtitle: Text("Criado em: " +
                                      formattedDate(item.createdAt)),
                                  leading: progressCircular(item.percentage),
                                  trailing: menuDropdown(item)),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }

  String formattedDate(int createdAt) {
    return dateFormat.format(DateTime.fromMillisecondsSinceEpoch(createdAt));
  }

  Widget order() {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Ordenar por: "),
          StreamBuilder(
            stream: classesBloc.orderBySelected.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return DropdownButton(
                  value: snapshot.data,
                  items: [
                    DropdownMenuItem(
                      child: Text("Data"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("Nome"),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text("Progresso"),
                      value: 3,
                    )
                  ],
                  onChanged: (value) {
                    switch (value) {
                      case 1:
                        classesBloc.orderByDate();
                        break;
                      case 2:
                        classesBloc.orderByName();
                        break;
                      case 3:
                        classesBloc.orderByProgress();
                        break;
                    }
                  },
                );
              } else
                return Container();
            },
          ),
        ],
      ),
    );
  }

  Widget progressCircular(int percentage) {
    return percentage == 0
        ? Container(
            width: 20,
          )
        : Container(
            width: 40,
            child: CircularPercentIndicator(
              percent: percentage * 0.01,
              center: percentage != 100
                  ? Text(percentage.toString() + "%")
                  : Icon(Icons.done),
              progressColor: Colors.green,
              radius: 45.0,
              lineWidth: 5.0,
            ),
          );
  }

  Widget menuDropdown(Class item) {
    return PopupMenuButton(
      icon: Icon(Icons.more_vert),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Text("Excluir"),
          value: 1,
        ),
        PopupMenuItem(
          child: Text("Detalhes"),
          value: 2,
        )
      ],
      onSelected: (value) {
        if (value == 1)
          dialogDelete(item);
        else
          dialogDetails(item, context);
      },
    );
  }

  void dialogDelete(Class item) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Deseja excluir essa aula?"),
            actions: [
              FlatButton(
                child: Text(
                  "Não",
                  style: TextStyle(color: Colors.grey[700]),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              InkWell(
                child: Container(
                    margin: const EdgeInsets.only(right: 6),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: Colors.grey[700])),
                    child: Text(
                      "Sim",
                    )),
                onTap: () {
                  classesBloc.deleteClass(item);
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  void dialogDetails(Class item, context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: Container(
                height: 120,
                child: Column(
                  children: [
                    Text(
                      "ID:\n${item.id}\n",
                      style: TextStyle(fontSize: 14),
                    ),
                    InkWell(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            children: [Icon(Icons.copy), Text("Copiar ID")],
                          ),
                        ),
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: item.id));
                        })
                  ],
                ),
              ),
              actions: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 6),
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(color: Colors.grey[700])),
                      child: Text(
                        "Voltar",
                      ),
                    ))
              ]);
        });
  }
}
