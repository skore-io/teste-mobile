import 'package:teste_mobile/model/class_model.dart';
import 'package:teste_mobile/modules/home/home_service.dart';

class HomeController {
  final HomeService homeService = HomeService();

  List<Class> fetchData() {
    final data = homeService.fetchData();
    List<Class> classes = [];
    for (final i in data) {
      classes.add(Class.fromJson(i));
    }
    return classes;
  }
}
