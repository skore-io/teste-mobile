import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste_uol/controllers/card_list_controller.dart';

class CardToList extends StatelessWidget {
  CardToList(this.index);
  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: CardListController(),
        builder: (CardListController controller) => Column(children: [
              Divider(
                height: 2.0,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Text(
                  'Nome:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(controller.card[index].name!)
              ]),
              SizedBox(height: 2),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Text(
                  'Data de Criação:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(controller.card[index].createdAt.toString())
              ]),
              SizedBox(height: 2),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Text(
                  'ID Aula:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                    '${controller.card[index].id.toString().substring(0, 5)}***')
              ]),
              SizedBox(height: 2),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Text(
                  'Completa:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                controller.check(index)!
              ]),
              SizedBox(height: 2),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.amber[200])),
                  onPressed: () {
                    controller.delete(index);
                  },
                  child: Text('Excluir este Card'))
            ]));
  }
}
