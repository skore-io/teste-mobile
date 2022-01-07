import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:score_cursos/app/common/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:score_cursos/app/modules/splash/ui/splash_store.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}
class SplashPageState extends State<SplashPage> {
  final SplashStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    store.initialize(onError: onError);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                primaryColor,
                secondaryColor
              ],
                begin: Alignment.topLeft,
              )
          ),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/overlay.png')
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AnimationLimiter(
                  child: Column(
                    children: AnimationConfiguration.toStaggeredList(
                      duration: const Duration(seconds: 2),
                      childAnimationBuilder: (widget) => SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: widget,
                        ),
                      ),
                      children: [
                        Image.asset("assets/images/logo_colored.png", height: 200,),
                        Text("Score Cursos", style: TextStyle(color: accentColor, fontWeight: FontWeight.bold, fontSize: 35), textAlign: TextAlign.center,),
                        Text("Dê um UP no seu score intelectual", style: TextStyle(color: accentColor.withOpacity(0.7), fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ),
                LinearProgressIndicator(
                  color: accentColor,
                  backgroundColor: primaryColor,
                )
              ],
            ),
          ),
        )
    );
  }

  void onError(String msg){
    MotionToast.error(
      title: 'Tivemos um problema',
      description: msg,
    ).show(context);
  }
}