import 'dart:convert';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:teste_mobile/models/class.dart';
import 'package:teste_mobile/repositories/json_data.dart';

class ClassesBloc extends BlocBase {

  final _controller = BehaviorSubject<List<Class>>();
  Stream<List> get outClasses => _controller.stream;
  List<Class> _classes;

  ClassesBloc(){
    List<dynamic> list = jsonDecode(jsonData);
    _classes = list.map((item) => Class.fromMap(item)).toList();
    _controller.add(_classes..sort((a, b) => a.createdAt - b.createdAt));
  }

  void remove(String id){
    _classes.removeWhere((element) => element.id == id);
    _controller.add(_classes);
    // TODO - Delete from repository
  }

  @override
  void dispose() {
    _controller.close();
  }

}