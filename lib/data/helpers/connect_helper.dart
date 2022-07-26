import 'package:my_application/data/data.dart';
import 'package:my_application/domain/entities/entities.dart';
import 'package:my_application/domain/models/models.dart';

class ConnectHelper {
  final apiWrapper = ApiWrapper();

  Future<ResponseModel> apiFetch() async => await apiWrapper.makeRequest(
      'https://fakestoreapi.com/products', Request.get, null, false, {});

  Future<ResponseModel> apiMyData(index) async => await apiWrapper.makeRequest(
      'https://fakestoreapi.com/products/$index', Request.get, null, false, {});

  Future<ResponseModel> apiJewellery() async {
    var res = await apiWrapper.makeRequest(
        'https://fakestoreapi.com/products/category/jewelery',
        Request.get,
        null,
        false, {});
    return res;
  }

  Future<ResponseModel> apiElectronic() async {
    var res = await apiWrapper.makeRequest(
        'https://fakestoreapi.com/products/category/electronics',
        Request.get,
        null,
        false, {});
    return res;
  }

  Future<ResponseModel> apiMenCloth() async {
    var res = await apiWrapper.makeRequest(
        "https://fakestoreapi.com/products/category/men's%20clothing",
        Request.get,
        null,
        false, {});
    return res;
  }

  Future<ResponseModel> apiWomenCloth() async {
    var res = await apiWrapper.makeRequest(
        "https://fakestoreapi.com/products/category/women's%20clothing",
        Request.get,
        null,
        false, {});
    return res;
  }
}
