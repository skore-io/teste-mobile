import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testemobile/data/constants/app_colors.dart';

class OnboardingController extends GetxController {
  List<Widget> carouselItems = [
    Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.lightPurple,
            AppColors.purple,
          ],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.purple.withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('lib/assets/banner0.png'),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: FittedBox(
              child: Text(
                'Experiência de Aprendizagem\nDigital',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Text(
            'Em um contexto de constantes transformações é preciso flexibilidade e dinamismo para adquirir novos conhecimentos conforme as mudanças acontecem.',
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
    Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.lightSalmon,
            AppColors.salmon,
          ],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.salmon,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('lib/assets/banner1.png'),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: FittedBox(
              child: Text(
                'Aprendizagem ao\nLongo da Vida',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Text(
            'Para os desafios de hoje, é preciso aprender novas habilidades de forma contínua, seja nas empresas ou nas instituições de ensino.',
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
    Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.lightBlue,
            AppColors.pastelBlue,
          ],
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.pastelBlue,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('lib/assets/banner2.png'),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: FittedBox(
              child: Text(
                'Carreira na Nova\nEconomia',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Text(
            'Em um contexto de constantes transformações é preciso flexibilidade e dinamismo para adquirir novos conhecimentos conforme as mudanças acontecem.',
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  ];

  startButton() {
    Get.offAllNamed('/home');
  }
}
