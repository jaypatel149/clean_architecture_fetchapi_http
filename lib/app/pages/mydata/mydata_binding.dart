import 'package:get/get.dart';
import 'package:my_application/domain/domain.dart';
import 'package:my_application/data/data.dart';
import 'package:my_application/device/device.dart';
import 'package:my_application/app/app.dart';

class MyDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MyDataController(Get.put(MyDataPresenter(Get.put(AuthUseCases(
          Get.put(Repository(Get.put(DeviceRepository()),
              Get.put(DataRepository(Get.put(ConnectHelper())))))))))),
    );
  }
}
