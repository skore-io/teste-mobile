import 'package:mobileteste/app/modules/home/domain/usecases/get_all_class_from_list.dart';
import 'package:mobileteste/app/modules/home/infra/models/todo_class_model.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GetAllClassFromList getAllClassFromList;

  _HomeControllerBase(this.getAllClassFromList) {
    getList();
  }

  @observable
  List<TodoClassModel> todoClass = [];

  @action
  Future<void> getList() async {
    final response = await getAllClassFromList();
    response.fold((failure) => failure,
        (result) => todoClass = result as List<TodoClassModel>);
  }
}
