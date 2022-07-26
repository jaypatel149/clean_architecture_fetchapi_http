import 'package:my_application/data/repositories/repositories.dart';
import 'package:my_application/device/device.dart';
import 'package:my_application/domain/models/models.dart';
import 'package:my_application/domain/models/womencloth_dummy.dart';

class Repository {
  Repository(this._deviceRepository, this._dataRepository);

  final DeviceRepository _deviceRepository;
  final DataRepository _dataRepository;

  Future<List<DummyModel>?> apiFetch() async {
    try {
      final response = await _dataRepository.apiFetch();
      if (!response.hasError && response.data.isNotEmpty) {
        return dummyModelFromJson(response.data);
      }
    } catch (error) {
      await _deviceRepository.apiFetch();
    }
    return null;
  }

  //////////details data///////

  Future<MyDataModel?> apiMyData(index) async {
    try {
      final response = await _dataRepository.apiMyData(index);
      if (!response.hasError && response.data.isNotEmpty) {
        return myDataModelFromJson(response.data);
      }
    } catch (error) {
      await _deviceRepository.apiMyData(index);
    }
    return null;
  }

  //////////jewellery data////

  Future<List<JewelleryModel>?> apiJewellery() async {
    try {
      var response = await _dataRepository.apiJewellery();
      if (!response.hasError && response.data.isNotEmpty) {
        return jewelleryModelFromJson(response.data);
      }
    } catch (error) {
      await _deviceRepository.apiJewellery();
    }
    return null;
  }

  /////Electronic data//////
  Future<List<ElectronicModel>?> apiElectronic() async {
    try {
      var response = await _dataRepository.apiElectronic();
      if (!response.hasError && response.data.isNotEmpty) {
        return electronicModelFromJson(response.data);
      }
    } catch (error) {
      await _deviceRepository.apiElectronic();
    }
    return null;
  }

  //////Mencloth data/////
  Future<List<MenClothModel>?> apiMenCloth() async {
    try {
      var response = await _dataRepository.apiMenCloth();
      if (!response.hasError && response.data.isNotEmpty) {
        return menClothModelFromJson(response.data);
      }
    } catch (error) {
      await _deviceRepository.apiMenCloth();
    }
    return null;
  }

  /////women cloth data ////
  Future<List<WomenClothModel>?> apiWomenCloth() async {
    try {
      var response = await _dataRepository.apiWomenCloth();
      if (!response.hasError && response.data.isNotEmpty) {
        return womenClothModelFromJson(response.data);
      }
    } catch (error) {
      await _deviceRepository.apiWomenCloth();
    }
    return null;
  }
}
