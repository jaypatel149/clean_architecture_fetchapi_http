import 'package:get/get.dart';
import 'package:my_application/app/pages/pages.dart';
import 'package:my_application/domain/models/models.dart';

class WomenclothApiController extends GetxController {
  WomenclothApiController(this._womenclothApiPresenter);
  final WomenclothApiPresenter _womenclothApiPresenter;

  List<WomenClothModel?> womenClothData = [];
  Future<void> apiWomenCloth() async {
    final res = await _womenclothApiPresenter.apiWomenCloth();
    if (res != null) {
      womenClothData = res;
    }
    update();
  }

  @override
  void onInit() async {
    await apiWomenCloth();
    super.onInit();
  }
}
