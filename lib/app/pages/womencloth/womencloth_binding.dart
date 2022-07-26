import 'package:get/get.dart';
import 'package:my_application/app/pages/pages.dart';
import 'package:my_application/data/data.dart';
import 'package:my_application/device/repositories/device_repositories.dart';
import 'package:my_application/domain/domain.dart';

class WomenclothBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => WomenclothApiController(Get.put(WomenclothApiPresenter(Get.put(
          AuthUseCases(Get.put(Repository(Get.put(DeviceRepository()),
              Get.put(DataRepository(Get.put(ConnectHelper())))))))))),
    );
  }
}
