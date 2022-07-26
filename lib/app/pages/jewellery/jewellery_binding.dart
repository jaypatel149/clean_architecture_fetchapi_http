import 'package:get/get.dart';
import 'package:my_application/app/pages/jewellery/jewellery_controller.dart';
import 'package:my_application/app/pages/jewellery/jewellery_presentor.dart';
import 'package:my_application/data/data.dart';
import 'package:my_application/device/repositories/device_repositories.dart';
import 'package:my_application/domain/domain.dart';

class JewelleryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => JewelleryApiController(Get.put(JewelleryApiPresenter(Get.put(
          AuthUseCases(Get.put(Repository(Get.put(DeviceRepository()),
              Get.put(DataRepository(Get.put(ConnectHelper())))))))))),
    );
  }
}
