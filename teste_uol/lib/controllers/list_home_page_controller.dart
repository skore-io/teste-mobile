import 'package:get/get.dart';
import 'package:teste_uol/storage/datas.dart';

class ListHomePageController extends GetxController {
  Datas datas = Datas();
  List data = [];
  RxList orderData = [].obs;
  int? fristValue;

  @override
  Future<void> onInit() async {
    getValues();
    super.onInit();
  }

  void getValues() {
    data.addAll(datas.list);
    print('DATA===>$data');
    orderDatas(data);
  }

  orderDatas(List data) {
    for (int i = 0; i < data.length; i++) {
      fristValue = data[i]['created_at'];
      if (fristValue! <= data[i]['created_at']) {
        fristValue = data[i]['created_at'];
        orderData.insert(0, data[i]);
      }
    }
    print('ORDERDATAS===>$orderData');
  }
}
