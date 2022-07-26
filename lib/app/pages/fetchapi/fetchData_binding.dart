import 'package:get/get.dart';
import 'package:my_application/app/app.dart';
import 'package:my_application/data/data.dart';
import 'package:my_application/device/device.dart';
import 'package:my_application/domain/domain.dart';

class FetchApiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => FetchApiController(Get.put(FetchApiPresenter(Get.put(AuthUseCases(
          Get.put(Repository(Get.put(DeviceRepository()),
              Get.put(DataRepository(Get.put(ConnectHelper())))))))))),
    );
  }
}
