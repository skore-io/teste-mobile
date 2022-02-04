import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skore_app/controllers/subjects_manager.dart';
import 'package:skore_app/models/data/subjects_data.dart';
import 'package:skore_app/ui/shared/const/c.dart';

class TitleClassField extends StatelessWidget {
  TitleClassField({ Key? key }) : super(key: key);

  final _titleClassController = TextEditingController();
 

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(5.0),
          child: TextField(
            onChanged: (value){
              context.read<SubjectsManager>().nameClass = value;
            },
            enabled: true,
            enableInteractiveSelection:
            false,
            controller: _titleClassController,
            keyboardType:
            TextInputType.text,
            style: const TextStyle(
                fontSize: 13.0,
                color: Colors.black),
            decoration: const InputDecoration(
              border:  OutlineInputBorder(),
              labelText: C.fieldClassName,
              hintStyle:  TextStyle(
                  fontFamily: "Georgia",
                  fontSize: 10.0),
            ),
          ),
        );  }
}