import 'package:my_application/domain/domain.dart';

class ElectronicApiPresenter {
  ElectronicApiPresenter(this.authUseCases);
  final AuthUseCases authUseCases;

  Future<List<ElectronicModel>?> apiElectronic() async =>
      await authUseCases.apiElectronic();
}
