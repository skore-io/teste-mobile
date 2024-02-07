import 'package:flutter/material.dart';

class AppUnknowView extends StatelessWidget {
  const AppUnknowView({Key? key}) : super(key: key);
  static const routeName = '/unknow_view';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('ROTA DESCONHECIDA'),
    ));
  }
}