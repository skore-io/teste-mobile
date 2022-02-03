import 'package:flutter/material.dart';
import 'package:skore_app/ui/shared/colors_app.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        gradient:  LinearGradient(
          colors: [ColorsApp.instance.primaryColor, ColorsApp.instance.secondaryColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        color: Colors.blue,
      ),
    );
  }
}