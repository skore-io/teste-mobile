import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:score_cursos/app/common/utils/constants.dart';

class SliderComponent extends StatelessWidget {
  String? title, subtitle, imageAsset;
  SliderComponent({@required this.title, this.subtitle, @required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Flex(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          direction: Axis.vertical,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(40),
                child: Image.asset(imageAsset!),
              ),
            ),
            Container(
                padding: EdgeInsets.all(20),
                child: AnimationLimiter(
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: AnimationConfiguration.toStaggeredList(
                            duration: Duration(milliseconds: 500),
                            childAnimationBuilder: (widget) => SlideAnimation(
                              verticalOffset: 50.0,
                              duration: Duration(milliseconds: 500),
                              child: FadeInAnimation(
                                child: widget,
                              ),
                            ),
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                title!,
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: primaryColor),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                subtitle!,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey),
                                textAlign: TextAlign.center,
                              ),
                            ]))))
          ],
        ),
      ),
    );
  }
}
