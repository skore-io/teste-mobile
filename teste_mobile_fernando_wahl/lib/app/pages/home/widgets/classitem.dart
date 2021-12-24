import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_mobile_fernando_wahl/app/core/utils/hexcolor.dart';
import 'package:teste_mobile_fernando_wahl/app/data/classes/classes_model.dart';
import 'package:teste_mobile_fernando_wahl/app/modules/home/home_controller.dart';

class ClassItemWidget extends GetWidget {
  final ClasseModel? classe;
  final Function()? onDelete;

  ClassItemWidget({
    this.classe,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Container(
        margin: EdgeInsets.all(10),
        color: Colors.green,
        child: ExpansionPanelList(
          animationDuration: Duration(milliseconds: 1000),
          children: [
            ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return Container(
                    color: HexColor("FCFCFC"),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(classe!.name!,
                                    style:
                                        TextStyle(color: HexColor("00CEB2"))),
                              ),
                            ],
                          ),
                        ),
                        LinearProgressIndicator(
                          backgroundColor: HexColor("FCFCFC"),
                          valueColor:
                              AlwaysStoppedAnimation<Color>(HexColor("00CEB2")),
                          value: classe!.summary!.percentage! / 100,
                        ),
                      ],
                    ),
                  );
              },
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (controller.showDetails!)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Data: ${classe!.createdAt}",
                              style: TextStyle(
                                  fontSize: 15.0, color: HexColor("4F4F4F"))),
                          Text("ID: ${classe!.id}",
                              style: TextStyle(
                                  fontSize: 15.0, color: HexColor("4F4F4F"))),
                          Text("Name: ${classe!.name}",
                              style: TextStyle(
                                  fontSize: 15.0, color: HexColor("4F4F4F"))),
                          Text("Status: ${classe!.status}",
                              style: TextStyle(
                                  fontSize: 15.0, color: HexColor("4F4F4F"))),
                          Divider(),
                          ElevatedButton(
                            child: Text('Apagar'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.teal,
                              onPrimary: Colors.white,
                              shadowColor: Colors.black,
                              elevation: 2,
                            ),
                            onPressed: onDelete,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              isExpanded: controller.showDetails!,
              canTapOnHeader: true,
            ),

          ],
          dividerColor: Colors.grey,
          expansionCallback: (panelIndex, isExpanded) {
            controller.showCard();
          },
        ),
      );
    });



    
  }
  List<ClassItemWidget> itemData = <ClassItemWidget>[
    
  ];
}
