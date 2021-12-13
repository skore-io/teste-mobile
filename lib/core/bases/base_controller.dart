import 'package:mobx/mobx.dart';
part 'base_controller.g.dart';

class BaseController = _BaseControllerBase with _$BaseController;

abstract class _BaseControllerBase with Store {
  Future<T> runAsyncAction<T>(Future<T> Function() action) async {
    try {
      return await action();
    } catch (error) {
      // implement show dialog error globally or push error page
      return Future.error(error);
    }
  }
}
