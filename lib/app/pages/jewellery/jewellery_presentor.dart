import 'package:my_application/domain/models/jewellery_dummy.dart';
import 'package:my_application/domain/usecases/auth_usecases.dart';

class JewelleryApiPresenter {
  JewelleryApiPresenter(this.authUseCases);
  final AuthUseCases authUseCases;

  Future<List<JewelleryModel>?> apiJewellery() async =>
      await authUseCases.apiJewellery();
}
