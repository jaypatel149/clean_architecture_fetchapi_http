import 'package:get/get.dart';
import 'package:my_application/app/pages/jewellery/jewellery.dart';
import 'package:my_application/domain/models/jewellery_dummy.dart';

class JewelleryApiController extends GetxController {
  JewelleryApiController(this._jewelleryApiPresenter);
  final JewelleryApiPresenter _jewelleryApiPresenter;

  List<JewelleryModel?> jewelleryData = [];
  Future<void> apiJewellery() async {
    final res = await _jewelleryApiPresenter.apiJewellery();
    if (res != null) {
      jewelleryData = res;
    }
    update();
  }

  String titleupdated() {
    update(['title-update']);
    return 'premium Silver chain';
  }

  double ratingupdated() {
    update(['rate-update']);
    return 4.5;
  }

  double priceupdated() {
    update(['price-update']);
    return 500.0;
  }

  @override
  void onInit() async {
    await apiJewellery();
    super.onInit();
  }
}
