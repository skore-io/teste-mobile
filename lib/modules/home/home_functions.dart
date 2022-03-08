import 'package:teste_mobile/model/class_model.dart';
import 'package:teste_mobile/shared/class_item.dart';

class HomeFunctions {
  /// Return list of classes to be rendered on [HomePage]
  List<ClassItem> classesList(
      List<Class> classes, bool deleting, Function deleteFunction) {
    final List<ClassItem> items = [];
    for (final i in classes) {
      items.add(ClassItem(
        item: i,
        canDelete: deleting,
        deleteFunction: deleteFunction,
      ));
    }
    return items;
  }

  List<Class> deleteItem(List<Class> classes, Class item) {
    classes.removeWhere((element) => element.id == item.id);
    return classes;
  }

  List<Class> sortListByCreateAt(List<Class> classes) {
    classes.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return classes;
  }
}
