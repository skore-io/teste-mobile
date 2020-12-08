import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teste_mobile/blocs/classes_bloc.dart';
import 'package:teste_mobile/constants/ui.dart';
import 'package:teste_mobile/models/class.dart';
import 'package:teste_mobile/screens/widgets/progress_bar.dart';

class ClassCard extends StatelessWidget {

  final Class classInfo;

  ClassCard({this.classInfo});

  @override
  Widget build(BuildContext context) {
    IconData _leading;
    Color _leadingColor;
    if(classInfo.summary.percentage == 100){
      _leading = Icons.check;
      _leadingColor = primary;
    }else if(classInfo.summary.percentage == null) {
      _leading = Icons.check;
      _leadingColor = Colors.transparent;
    }else{
      _leading = Icons.class__outlined;
      _leadingColor = secondaryTextColor;
    }
    final _bloc = BlocProvider.of<ClassesBloc>(context);
    print(classInfo.toMap());
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      tileColor: Colors.white,
      leading: Icon(
        _leading,
        color: _leadingColor,
      ),
      title: Text(
        classInfo.name,
        style: primaryText,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat('dd/MM/yyy').format(DateTime.fromMillisecondsSinceEpoch(classInfo.createdAt)),
            style: secondaryText,
          ),
          Text(
            '${classInfo.id}',
            style: idText,
          ),
          ProgressBar(progress: classInfo.summary.percentage),
        ],
      ),
      isThreeLine: true,
      trailing: IconButton(
        onPressed: () => _bloc.remove(classInfo.id),
        icon: Icon(
          Icons.delete_outline,
          color: secondaryTextColor,
        ),
      ),
    );
  }
}
