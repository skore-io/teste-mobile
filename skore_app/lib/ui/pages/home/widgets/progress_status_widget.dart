import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:skore_app/models/data/subjects_data.dart';


class ProgressStatusWidget extends StatelessWidget {
  final SubjectsData data;
  const ProgressStatusWidget({Key? key,required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget widgetSelected = Container();

    switch(data.status){
      case "COMPLETED":
        widgetSelected = const SizedBox(
          width: 50,
          height: 50,
          child: Center(
              child: FlareActor("assets/success_check.flr",
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  animation: "Untitled")),
        );
        break;
      case "IN_PROGRESS":
        int percentage = data.summary["percentage"] as int;
        double percentageFormatted = percentage / 100;
        widgetSelected =  LinearPercentIndicator(
          barRadius: const Radius.circular(10),
          width: 100.0,
          lineHeight: 14.0,
          alignment: MainAxisAlignment.center,
          animation: true,
          percent: percentageFormatted,
          backgroundColor: Colors.grey,
          progressColor: Colors.green,
        );
        break;
      default:
        widgetSelected = Container();
    }
    return widgetSelected;
  }
}
