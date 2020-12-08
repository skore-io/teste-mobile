import 'package:flutter/material.dart';
import 'package:teste_mobile/constants/ui.dart';

class ProgressBar extends StatelessWidget {

  final int progress;

  ProgressBar({this.progress});

  @override
  Widget build(BuildContext context) {
    if(progress == null) return Container();
    final position = progress / 100;
    return LayoutBuilder(
      builder: (context, constraints) =>
        Container(
          width: (constraints.maxWidth) * position,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$progress%',
                textAlign: TextAlign.end,
              ),
              Container(
                height: 4,
                color: secondary,
              )
            ],
          ),
        ),
    );
  }
}
