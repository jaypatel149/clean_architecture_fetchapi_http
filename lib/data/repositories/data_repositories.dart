import 'package:my_application/data/data.dart';
import 'package:my_application/domain/domain.dart';

class DataRepository extends DomainRepository {
  DataRepository(this.connectHelper);
  final ConnectHelper connectHelper;
  @override
  Future<ResponseModel> apiFetch() async => await connectHelper.apiFetch();

  @override
  Future<ResponseModel> apiMyData(index) async =>
      await connectHelper.apiMyData(index);

  @override
  Future<ResponseModel> apiJewellery() async => connectHelper.apiJewellery();

  @override
  Future<ResponseModel> apiElectronic() async => connectHelper.apiElectronic();

  @override
  Future<ResponseModel> apiMenCloth() async => connectHelper.apiMenCloth();

  @override
  Future<ResponseModel> apiWomenCloth() async => connectHelper.apiWomenCloth();
}
