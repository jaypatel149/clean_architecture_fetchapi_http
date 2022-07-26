import 'package:get/get.dart';
import 'package:my_application/app/pages/pages.dart';
import 'package:my_application/domain/models/models.dart';

class ElectronicApiController extends GetxController {
  ElectronicApiController(this._electronicApiPresenter);
  final ElectronicApiPresenter _electronicApiPresenter;

  List<ElectronicModel?> electronicData = [];
  Future<void> apiElectronic() async {
    final res = await _electronicApiPresenter.apiElectronic();
    if (res != null) {
      electronicData = res;
    }
    update();
  }

  @override
  void onInit() async {
    await apiElectronic();
    super.onInit();
  }
}
