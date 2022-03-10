import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SimpleButton extends StatelessWidget {
  String title;
  Function onPressed;
  Color color;
  SimpleButton({Key? key, required this.title, required this.onPressed, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      minWidth: Get.width * 0.5,
      onPressed: () {
        onPressed();
      },
      color: color,
      shape: const StadiumBorder(),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
