import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:teste_mobile/blocs/classes_bloc.dart';
import 'package:teste_mobile/constants/ui.dart';
import 'package:teste_mobile/models/class.dart';
import 'package:teste_mobile/screens/widgets/class_card.dart';

class ClassListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _bloc = BlocProvider.of<ClassesBloc>(context);
    return Scaffold(
      backgroundColor: bodyBackground,
      body: SafeArea(
        child: StreamBuilder<List<Class>>(
          stream: _bloc.outClasses,
          builder: (context, snapshot) {
            return ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(8),
              children: snapshot.hasData
                ?
              snapshot.data.map((item) => ClassCard(classInfo: item,)).toList()
                :
              [
                Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(primary),
                  ),
                )
              ],
            );
          }
        ),
      ),
    );
  }
}
