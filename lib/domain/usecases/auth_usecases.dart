import 'package:my_application/domain/domain.dart';
import 'package:my_application/domain/models/womencloth_dummy.dart';

class AuthUseCases {
  AuthUseCases(this.repository);
  final Repository repository;

  Future<List<DummyModel>?> apiFetch() async => await repository.apiFetch();
  Future<MyDataModel?> apiMyData(index) async =>
      await repository.apiMyData(index);

  Future<List<JewelleryModel>?> apiJewellery() async =>
      await repository.apiJewellery();

  Future<List<ElectronicModel>?> apiElectronic() async =>
      await repository.apiElectronic();

  Future<List<MenClothModel>?> apiMenCloth() async =>
      await repository.apiMenCloth();

  Future<List<WomenClothModel>?> apiWomenCloth() async =>
      await repository.apiWomenCloth();
}
