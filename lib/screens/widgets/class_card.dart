import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teste_mobile/blocs/classes_bloc.dart';
import 'package:teste_mobile/constants/ui.dart';
import 'package:teste_mobile/models/class.dart';
import 'package:teste_mobile/screens/widgets/progress.dart';

class ClassCard extends StatelessWidget {

  final Class classInfo;

  ClassCard({this.classInfo});

  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<ClassesBloc>(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Container(
        child: ListTile(
          key: Key(classInfo.id),
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          leading: buildLeading(classInfo.status),
          title: Text(
            classInfo.name,
            style: primaryText,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat('dd/MM/yyy')
                  .format(DateTime.fromMillisecondsSinceEpoch(classInfo.createdAt)),
                style: secondaryText,
              ),
              Text(
                classInfo.id,
                style: idText,
              ),
            ],
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.delete_outline,
              color: secondaryTextColor,
            ),
            onPressed: () => _bloc.remove(classInfo.id),
          ),
        ),
      ),
    );
  }

  Widget buildLeading(Status status){
    Widget _child;
    switch(classInfo.status){
      case Status.COMPLETED:
        _child = Icon(
          Icons.check,
          color: primary,
        );
        break;
      case Status.IN_PROGRESS:
        _child = Progress(progress: classInfo.summary.percentage);
        break;
      case Status.NOT_STARTED:
    }
    return Container(
      height: 50,
      width: 50,
      child: _child,
    );
  }
}
