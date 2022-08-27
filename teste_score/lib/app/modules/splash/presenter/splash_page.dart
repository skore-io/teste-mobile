import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:teste_score/app/theme/app_theme.dart';
import 'package:teste_score/app/utils/constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future navigation() async {
    await Future.delayed(const Duration(seconds: 2));

    Modular.to.navigate('/home/');
  }

  @override
  void initState() {
    super.initState();

    navigation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: context.screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Divider(),
              Text(
                'Class Room',
                style: AppTheme.textStyles.titleSplash,
              ),
              const Divider()
            ],
          ),
        ),
      ),
    );
  }
}
