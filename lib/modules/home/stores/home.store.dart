import 'package:get/get.dart';
import 'package:skoreio/core/enums/loadingstatus.enum.dart';
import 'package:skoreio/core/models/classes.model.dart';
import 'package:skoreio/modules/home/repositories/home.repository.dart';

class HomeStore extends GetxController {
  HomeStore(this._repository);
  HomeRepository _repository;

  final listClasses = List<ClassModel>().obs;
  final loadingStatus = ELoadingStatus.completed.obs;

  Future fetchAllClasses() async {
    loadingStatus.value = ELoadingStatus.loading;
    listClasses.value = await _repository.getClasses();
    loadingStatus.value = ELoadingStatus.completed;
  }
}
