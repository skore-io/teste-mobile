import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget() : super(key: const Key('LoadingWidget'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text(
              'Aulas',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
