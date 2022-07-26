part of 'app_pages.dart';

abstract class Routes {
  static const fetchapi = Paths.fetchapi;
  static const myData = Paths.myData;
  static const jewelleryData = Paths.jewelleryData;
  static const electronicData = Paths.electronicData;
  static const menClothData = Paths.menClothData;
  static const womenClothData = Paths.womenClothData;
}

abstract class Paths {
  static const fetchapi = '/fetch-api-screen';
  static const myData = '/my-data-screen';
  static const jewelleryData = '/jewellery-data-screen';
  static const electronicData = '/electronic-data-screen';
  static const menClothData = '/mencloth-data-screen';
  static const womenClothData = '/womencloth-data-screen';
}
