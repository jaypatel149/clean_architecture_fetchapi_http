import 'package:get/get.dart';
import 'package:my_application/app/app.dart';

part 'app_routes.dart';

class AppPages {
  static var transitionDuration = const Duration(milliseconds: 350);

  static const initial = Routes.fetchapi;
  static final pages = [
    GetPage<FetchApiView>(
      name: Paths.fetchapi,
      transitionDuration: transitionDuration,
      page: FetchApiView.new,
      binding: FetchApiBinding(),
      transition: Transition.fadeIn,
    ),
    //////mydata//////
    GetPage<MydataView>(
      name: Paths.myData,
      transitionDuration: transitionDuration,
      page: MydataView.new,
      binding: MyDataBinding(),
      transition: Transition.fadeIn,
    ),

    ///////jewellery data////////
    GetPage<JewelleryView>(
      name: Paths.jewelleryData,
      transitionDuration: transitionDuration,
      page: JewelleryView.new,
      binding: JewelleryBinding(),
      transition: Transition.fadeIn,
    ),

    /////////electronic data//////
    GetPage<ElectronicView>(
      name: Paths.electronicData,
      transitionDuration: transitionDuration,
      page: ElectronicView.new,
      binding: ElectronicBinding(),
      transition: Transition.fadeIn,
    ),

//////////mencloth data///////

    GetPage<MenclothView>(
      name: Paths.menClothData,
      transitionDuration: transitionDuration,
      page: MenclothView.new,
      binding: MenclothBinding(),
      transition: Transition.fadeIn,
    ),

    /////////women data///////
    GetPage<WomenclothView>(
      name: Paths.womenClothData,
      transitionDuration: transitionDuration,
      page: WomenclothView.new,
      binding: WomenclothBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
