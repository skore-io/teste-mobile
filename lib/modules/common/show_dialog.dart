import 'package:flutter/material.dart';

class ShowDialog {
  static Future<bool> dialogSN(
      String titulo, String texto, BuildContext context) async {
    return await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(titulo),
            content: Text(texto),
            actions: <Widget>[
              TextButton(
                child: Text("Não"),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              TextButton(
                child: Text("Sim"),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
  }
}
