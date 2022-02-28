import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_uol_skore_teste/controller/aulas_controller.dart';
import 'package:flutter_uol_skore_teste/models/aulas_model.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PageAulas extends StatefulWidget {
  @override
  _PageAulasState createState() => _PageAulasState();
}

class _PageAulasState extends State<PageAulas> {
  late AulasController controller;

  @override
  void initState() {
    controller = AulasController();
    _loadAulas();
    super.initState();
  }

  _loadAulas() async {
    await controller.getAulas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white, Colors.greenAccent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset('assets/Logo_skore.png'),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: 650,
                      child: Observer(builder: (_) {
                        if (controller.modelAulas != null) {
                          return createListBuilder();
                        } else {
                          return const Center(
                              child: CircularProgressIndicator(
                            color: Colors.greenAccent,
                          ));
                        }
                      }))
                ],
              ),
            ),
          ),
    ));
  }

  Widget createListBuilder() {
    return ListView.builder(
        itemCount: controller.modelAulas!.length,
        itemBuilder: (BuildContext context, int index) {
          return buildCard(controller.modelAulas![index]);
        });
  }

  Widget buildCard(AulasModel aulasModel) {
    return Card(
      shadowColor: Colors.black,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  aulasModel.name!,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "ID: " + aulasModel.id!,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                const Icon(Icons.date_range),
                const SizedBox(
                  width: 10,
                ),
                Text("Data de Criação: " + aulasModel.createDate!,
                    style: const TextStyle(
                      fontSize: 15,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Prograsso: ' + checkPercentIsNull(aulasModel.summary!.percentage.toString())),
                validComplete(aulasModel)
              ],
            ),
            Chip(
                label: const Text("Deletar"),
                onDeleted: (){
                  setState(() {
                    aulasModel.createDate = '';
                  });
                },
            )
            /*GestureDetector(
              onTap: (){
                aulasModel.deleteAulaModel();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Excluir da Lista",style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.bold),),
                  Icon(Icons.cancel_outlined, color: Colors.red,),
                ],
              ),
            )*/
          ],
        ),
      ),
    );
  }
}

Widget validComplete(AulasModel model){
  if(model.summary!.percentage == 100){
    return const Icon(Icons.done,color: Colors.green);
  }else{
    model.summary ??= Summary();
    model.summary!.percentage == null ? model.summary!.percentage = 0 : model.summary!.percentage!;
    return CircularPercentIndicator(
      radius: 20.0,
      lineWidth: 4.0,
      percent: (model.summary!.percentage! / 100).toDouble() ,
      center: Text(model.summary!.percentage.toString()),
      progressColor: Colors.green,
    );
  }
}

String checkPercentIsNull(String percent){
  if(percent.contains('null')){
    percent = '0';
  }
  return percent;
}
