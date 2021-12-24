import 'dart:ui';
import 'package:get/get.dart';
import 'package:teste_mobile_fernando_wahl/app/core/translations/pt_BR/pt_br_translations.dart';
import 'en_US/en_us_translations.dart';


class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static final fallbackLocale = Locale('pt', 'BR');

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUs,
    'pt_BR': ptBR,
  };


}