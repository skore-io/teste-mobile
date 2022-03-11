import 'package:flutter/material.dart';
import 'package:testeuol/core/app_images.dart';
import 'package:testeuol/modules/home/home_page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((_) => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        ));

    return Scaffold(
      body: Center(
        child: Image.asset(AppImages.logo),
      ),
    );
  }
}
