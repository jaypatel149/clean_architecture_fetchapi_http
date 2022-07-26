import 'package:my_application/domain/domain.dart';

class DeviceRepository extends DomainRepository {
  @override
  Future<ResponseModel> apiFetch() {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> apiMyData(int index) {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> apiJewellery() {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> apiElectronic() {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> apiMenCloth() {
    throw UnimplementedError();
  }

  @override
  Future<ResponseModel> apiWomenCloth() {
    throw UnimplementedError();
  }
}
