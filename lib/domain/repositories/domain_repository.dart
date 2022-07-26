import 'package:my_application/domain/models/models.dart';

abstract class DomainRepository {
  Future<ResponseModel> apiFetch();
  Future<ResponseModel> apiMyData(int index);
  Future<ResponseModel> apiJewellery();
  Future<ResponseModel> apiElectronic();
  Future<ResponseModel> apiMenCloth();
  Future<ResponseModel> apiWomenCloth();
}
