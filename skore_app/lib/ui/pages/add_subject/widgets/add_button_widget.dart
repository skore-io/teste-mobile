import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skore_app/controllers/subjects_manager.dart';
import 'package:skore_app/models/data/subjects_data.dart';

class AddButtonWidget extends StatelessWidget {
  const AddButtonWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: (){
          context.read<SubjectsManager>().fetchAddSubject(context);

        },
        style: ElevatedButton.styleFrom(primary: Color(0xFFF26868)),
        child: Container(
          child: const Text("Adicionar",style: TextStyle(
              fontSize: 14,
              fontFamily:
              "QuickSandRegular")),
        ),
        ));
}}