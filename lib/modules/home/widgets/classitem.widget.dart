import 'package:flutter/material.dart';
import 'package:skoreio/core/models/classes.model.dart';
import 'package:skoreio/core/styles/appcolors.style.dart';
import 'package:skoreio/core/styles/appstyles.style.dart';

// ignore: must_be_immutable
class ClassItemWidget extends StatefulWidget {
  bool showDetails;
  final ClassModel classe;
  final Function onDelete;

  ClassItemWidget({
    Key key,
    @required this.classe,
    @required this.onDelete,
    this.showDetails = false,
  }) : super(key: key);

  @override
  _ClassItemWidgetState createState() => _ClassItemWidgetState();
}

class _ClassItemWidgetState extends State<ClassItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () => setState(() {
              widget.showDetails = !widget.showDetails;
            }),
            child: Container(
              color: AppColors.WHITEFC,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(widget.classe.name, style: AppStyles.head1.copyWith(color: AppColors.PRIMARY)),
                        ),
                        if (widget.classe.status == "COMPLETED")
                          Icon(Icons.check_circle_outline, color: AppColors.PRIMARY),
                        if (widget.classe.status == "IN_PROGRESS")
                          Icon(Icons.remove_red_eye, color: AppColors.DISABLED),
                        Icon(Icons.arrow_drop_down, color: AppColors.PRIMARY),
                      ],
                    ),
                  ),
                  LinearProgressIndicator(
                    backgroundColor: AppColors.WHITEFC,
                    valueColor: new AlwaysStoppedAnimation<Color>(AppColors.PRIMARY),
                    value: widget.classe.summary.percentage / 100,
                  ),
                ],
              ),
            ),
          ),
          if (widget.showDetails)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Data: ${widget.classe.createdAtFormatted}", style: AppStyles.body1),
                  Text("ID: ${widget.classe.id}", style: AppStyles.body1),
                  Divider(),
                  Center(
                    child: OutlineButton(
                      textColor: AppColors.DANGER,
                      borderSide: BorderSide(color: AppColors.DANGER),
                      onPressed: widget.onDelete,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.delete),
                          Text("Apagar"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
