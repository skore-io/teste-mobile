import 'package:teste_mobile/model/class_model.dart';

class HomeFunctions {
  /// Return list of classes to be rendered on [HomePage]

  List<Class> deleteItem(List<Class> classes, Class item) {
    classes.removeWhere((element) => element.id == item.id);
    return classes;
  }

  List<Class> sortListByCreateAt(List<Class> classes) {
    classes.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return classes;
  }
}
