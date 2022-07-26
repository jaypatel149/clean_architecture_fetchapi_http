import 'package:get/get.dart';
import 'package:my_application/app/app.dart';
import 'package:my_application/data/helpers/connect_helper.dart';
import 'package:my_application/data/repositories/data_repositories.dart';
import 'package:my_application/device/repositories/device_repositories.dart';
import 'package:my_application/domain/repositories/repository.dart';
import 'package:my_application/domain/usecases/auth_usecases.dart';

class ElectronicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ElectronicApiController(Get.put(ElectronicApiPresenter(Get.put(
          AuthUseCases(Get.put(Repository(Get.put(DeviceRepository()),
              Get.put(DataRepository(Get.put(ConnectHelper())))))))))),
    );
  }
}
