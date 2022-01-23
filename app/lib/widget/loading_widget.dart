import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget() : super(key: const Key('LoadingWidget'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          Text('Aulas'),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
