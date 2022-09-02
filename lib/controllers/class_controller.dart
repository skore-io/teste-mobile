import 'package:flutter/material.dart';
import 'package:my_classes/data/class_data.dart';
import 'package:my_classes/models/class_model.dart';

class ClassController with ChangeNotifier {
  final List<ClassModel> _items = classData;

  List<ClassModel> get items {
    _items.sort(
      (a, b) => b.createdAt!.toString().compareTo(a.createdAt.toString()),
    );
    return [..._items];
  }

  void removeClass(ClassModel classes) {
    int index = _items.indexWhere((c) => c.id == classes.id);

    if (index >= 0) {
      _items.removeWhere((c) => c.id == classes.id);

      notifyListeners();
    }
  }

  int get itemsCount {
    return _items.length;
  }
}
