import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:class_planner/mock/data.dart';
import 'package:class_planner/model/class.dart';
import 'package:diacritic/diacritic.dart';
import 'package:rxdart/rxdart.dart';

class ClassBloc extends BlocBase {
  final classes = BehaviorSubject<List<Class>>();
  final orderBySelected = BehaviorSubject<int>();
  final dataList = DataList();
  void loadClasses() {
    if (classes.value == null) {
      List<Class> list =
          dataList.data.map<Class>((item) => Class.fromJson(item)).toList();
      list.sort((a, b) => a.createdAt.compareTo(b.createdAt));
      classes.sink.add(list);
      orderBySelected.sink.add(1);
    }
  }

  void deleteClass(Class item) {
    List<Class> list = List.from(classes.value);
    classes.sink.add(null);
    list.remove(item);
    classes.sink.add(list);
  }

  void orderByDate() {
    List<Class> list = List.from(classes.value);
    classes.sink.add(null);
    list.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    orderBySelected.sink.add(1);
    classes.sink.add(list);
  }

  void orderByName() {  
     List<Class> list = List.from(classes.value);
    classes.sink.add(null);
    list.sort((a, b) => removeDiacritics(a.name).compareTo(removeDiacritics(b.name)));
    orderBySelected.sink.add(2);
    classes.sink.add(list);
  }

  void orderByProgress() {  
     List<Class> list = List.from(classes.value);
    classes.sink.add(null);
    list.sort((a, b) => a.percentage.compareTo(b.percentage));
    orderBySelected.sink.add(3);
    classes.sink.add(list);
  }

  @override
  void dispose() {
    classes.close();
    orderBySelected.close();
    super.dispose();
  }
}
