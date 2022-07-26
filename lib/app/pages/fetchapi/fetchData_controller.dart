import 'package:get/get.dart';
import 'package:my_application/app/pages/fetchapi/fetchapi.dart';
import 'package:my_application/domain/domain.dart';

class FetchApiController extends GetxController {
  FetchApiController(this.fetchApiPresenter);
  final FetchApiPresenter fetchApiPresenter;

  List<DummyModel> dummyData = [];

  get jewelleryData => null;
  Future<void> apiFetch() async {
    final res = await fetchApiPresenter.apiFetch();
    if (res != null) {
      dummyData = res;
    }
    update();
  }

  @override
  void onInit() async {
    await apiFetch();
    super.onInit();
  }

  titleupdated() {}
}
