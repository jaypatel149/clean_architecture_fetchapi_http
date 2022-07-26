import 'package:get/get.dart';
import 'package:my_application/app/pages/pages.dart';
import 'package:my_application/domain/models/models.dart';

class MenclothApiController extends GetxController {
  MenclothApiController(this._menclothApiPresenter);
  final MenclothApiPresenter _menclothApiPresenter;

  List<MenClothModel?> menClothData = [];
  Future<void> apiMenCloth() async {
    final res = await _menclothApiPresenter.apiMenCloth();
    if (res != null) {
      menClothData = res;
    }
    update();
  }

  @override
  void onInit() async {
    await apiMenCloth();
    super.onInit();
  }
}
