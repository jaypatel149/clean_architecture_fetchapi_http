import 'package:get/get.dart';
import 'package:my_application/domain/models/mydata_dummy.dart';

import 'mydata_presenter.dart';

class MyDataController extends GetxController {
  MyDataController(this.myDataPresenter);
  final MyDataPresenter myDataPresenter;
  MyDataModel? dummyData;
  Future<void> apiMyData(int index) async {
    final res = await myDataPresenter.apiMyData(index);
    if (res != null) {
      dummyData = res;
    }
    update();
  }

  int index = 0;

  @override
  void onInit() async {
    index = Get.arguments as int? ?? 0;
    await apiMyData(index);
    super.onInit();
  }
}
