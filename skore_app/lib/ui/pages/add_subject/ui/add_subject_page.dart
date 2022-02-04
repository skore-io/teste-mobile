import 'package:flutter/material.dart';
import 'package:skore_app/ui/pages/add_subject/widgets/add_button_widget.dart';
import 'package:skore_app/ui/pages/add_subject/widgets/title_class_field.dart';
import 'package:skore_app/ui/shared/colors_app.dart';
import 'package:skore_app/ui/shared/const/c.dart';

class AddSubjectPage extends StatelessWidget {
  const AddSubjectPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(C.addClass),
        backgroundColor: ColorsApp.instance.primaryColor,
      ),
      body:  SafeArea(
        child: Column(
          children: [
            SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset("assets/logo.png")),
            TitleClassField(),
            const AddButtonWidget()
          ],
        ),
      )
    );
  }
}