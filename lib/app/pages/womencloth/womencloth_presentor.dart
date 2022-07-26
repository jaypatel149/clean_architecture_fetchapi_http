import 'package:my_application/domain/domain.dart';

class WomenclothApiPresenter {
  WomenclothApiPresenter(this.authUseCases);
  final AuthUseCases authUseCases;

  Future<List<WomenClothModel>?> apiWomenCloth() async =>
      await authUseCases.apiWomenCloth();
}
