import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testeuol/core/app_colors.dart';
import 'package:testeuol/core/app_text_styles.dart';
import 'package:testeuol/models/aula_model.dart';
import 'package:testeuol/modules/home/home_controller.dart';

class AulaCard extends StatelessWidget {
  final AulaModel aula;
  final HomeController controller;

  AulaCard({Key? key, required this.aula,  required this.controller})
      : assert(
            ["NOT_STARTED", "IN_PROGRESS", "COMPLETED"].contains(aula.status)),
        super(key: key);

  final config = {
    "NOT_STARTED": {
      "color": AppColors.notStarted,
      "borderColor": AppColors.notStartedBorder,
    },
    "IN_PROGRESS": {
      "color": AppColors.progress,
      "borderColor": AppColors.progressBorder,
    },
    "COMPLETED": {
      "color": AppColors.completed,
      "borderColor": AppColors.completedBorder,
    }
  };

  Color get color => config[aula.status]!['color']!;
  Color get borderColor => config[aula.status]!['borderColor']!;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            border: Border.fromBorderSide(BorderSide(color: borderColor)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      aula.name,
                      style: AppTextStyles.title,
                    ),
                    aula.status == "COMPLETED"
                        ? Icon(
                            Icons.check,
                            color: AppColors.green,
                            size: 30,
                          )
                        : aula.status == "IN_PROGRESS"
                            ? Text(aula.summary.percentage.toString() + "%",
                                style: AppTextStyles.percent)
                            : SizedBox()
                  ],
                ),
                Text(
                  "Criação: " + DateFormat('dd/MM/yyyy').format(aula.createdAt),
                  style: AppTextStyles.subTitle
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "id: " + aula.id,
                  style: AppTextStyles.subTitle,
                ),
                SizedBox(
                  height: 40,
                ),
                TextButton(
                  child: Text(
                    "Remover aula",
                    style: AppTextStyles.delete,
                  ),
                  onPressed: () {
                    controller.remove(aula, context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
