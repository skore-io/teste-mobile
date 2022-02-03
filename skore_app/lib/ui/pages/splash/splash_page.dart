import 'package:flutter/material.dart';
import 'package:skore_app/ui/shared/widgets/background_gradient.dart';




class SplashPage extends StatefulWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((value) => {
      Navigator.of(context).pushReplacementNamed("/home")


    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children:  [
        BackgroundGradient(),
        Center(
          child:  SizedBox(
                height: 200,
                width: 200,
                child: Image.asset("assets/logo.png")),
        )

      ],),
    );
  }
}