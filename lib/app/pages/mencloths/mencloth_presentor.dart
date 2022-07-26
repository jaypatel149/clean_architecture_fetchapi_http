import 'package:my_application/domain/domain.dart';

class MenclothApiPresenter {
  MenclothApiPresenter(this.authUseCases);
  final AuthUseCases authUseCases;

  Future<List<MenClothModel>?> apiMenCloth() async =>
      await authUseCases.apiMenCloth();
}
