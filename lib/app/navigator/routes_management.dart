import 'package:get/get.dart';
import 'package:my_application/app/app.dart';

abstract class RouteManagement {
  //////////Api-data////////

  static void goToFetchData() {
    Get.toNamed<void>(Routes.fetchapi);
  }

  ////////my-data/////////

  static void goToMydata({int index = 0}) {
    Get.toNamed<void>(Routes.myData, arguments: index);
  }

  //////////jewellery data/////

  static void goToJewelleryData() {
    Get.toNamed<void>(Routes.jewelleryData);
  }

  /////electronic////
  static void goToElectronicData() {
    Get.toNamed<void>(Routes.electronicData);
  }

  /////mencloth///
  static void goToMenclothData() {
    Get.toNamed<void>(Routes.menClothData);
  }

  /////Womencloth////
  static void goToWomenclothData() {
    Get.toNamed<void>(Routes.womenClothData);
  }
}
