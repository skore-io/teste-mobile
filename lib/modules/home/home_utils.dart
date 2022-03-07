import 'package:teste_mobile/model/class_model.dart';
import 'package:teste_mobile/shared/class_item.dart';

class HomeUtils {
  static List<ClassItem> classesList(List<Class> classes) {
    final List<ClassItem> items = [];
    for (final i in classes) {
      items.add(ClassItem(
        item: i,
      ));
    }
    return items;
  }
}
