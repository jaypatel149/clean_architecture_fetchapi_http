// coverage:ignore-file
import 'package:flutter/material.dart';

/// A list of custom color used in the application.
///
/// Will be ignored for test since all are static values and would not change.
abstract class ColorsValue {
  /// Colors

  static const Color blackColor = Color(
    blackColorHex,
  );

  static const Color whiteColor = Color(
    whiteColorHex,
  );

  static const Color greenColor = Color(
    greenColorHex,
  );

  static const Color redColor = Color(
    redColorHex,
  );

  static const Color orangeColor = Color(
    orangeColorHex,
  );

  static const Color blueColor = Color(
    blueColorHex,
  );

  static const Color skyBlueColor = Color(
    skyBlueColorHex,
  );

  static const Color greyColor = Color(
    greyColorHex,
  );

  static const Color transparent = Colors.transparent;

  // ============================================

  /// Non-common Colors
  ///
  static const Color facebookButtonColor = Color(
    facebookButtonColorHex,
  );

  static const Color iconColor = Color(
    iconColorHex,
  );

  static const Color greyLightColor = Color(
    greyLightColorHex,
  );

  static const Color purpleColor = Color(
    purpleColorHex,
  );

  static const Color lightGreyColorWithOpacity35 = Color(
    lightGreyColorWithOpacityHex35,
  );

  static const Color lightGreyColor = Color(
    lightGreyColorHex,
  );

  static const Color heavyGreyColor = Color(
    heavyGreyColorHex,
  );

  static const Color lightGreyColorWithOpacity50 = Color(
    lightGreyColorWithOpacityHex50,
  );

  static const Color lightRedColor = Color(
    lightRedColorHex,
  );

  static const Color blackColorWithOpacity59 = Color(
    blackColorHexWithOpacity59,
  );

  static const Color primaryColorWithOpacity = Color(
    primaryColorHexWithOpacity,
  );

  static const Color textFieldColor = Color(
    textFieldColorHex,
  );

  static const Color subTitleColor = Color(
    subTitlecolorHex,
  );

  static const Color originalGreyColor = Color(
    originalGreyColorHex,
  );

  static const Color textfieldHintColor = Color(
    textfieldHintColorHex,
  );

  static const Color bottomNavBgColor = Color(
    bottomNavBgColorHex,
  );

  // ===========================================================================

  /// Hex Values
  ///

  static const int blackColorHex = 0xff000000;
  static const int whiteColorHex = 0xffffffff;
  static const int greenColorHex = 0xff009944;
  static const int redColorHex = 0xffcf000f;
  static const int orangeColorHex = 0xfff0541e;
  static const int blueColorHex = 0xff2196f3;
  static const int skyBlueColorHex = 0xff63c0df;
  static const int greyColorHex = 0xff363636;

  // ============================================

  /// Hex Values for Non-Common Colors
  ///
  static const int facebookButtonColorHex = 0xff3B5998;
  static const int iconColorHex = 0xff606060;
  static const int greyLightColorHex = 0xff1C1C1C;
  static const int purpleColorHex = 0xffB000F0;
  static const int lightGreyColorWithOpacityHex35 = 0x59C9CCD1;
  static const int lightGreyColorHex = 0xffC9CCD1;
  static const int heavyGreyColorHex = 0xff666666;
  static const int lightGreyColorWithOpacityHex50 = 0x80C9CCD1;
  static const int lightRedColorHex = 0xffFF4A49;
  static const int blackColorHexWithOpacity59 = 0x59000000;
  static const int primaryColorHexWithOpacity = 0x596730EC;
  static const int textFieldColorHex = 0xffF1F2F6;
  static const int subTitlecolorHex = 0xfe666666;
  static const int originalGreyColorHex = 0xff535353;
  static const int textfieldHintColorHex = 0xffBFBFBF;
  static const int bottomNavBgColorHex = 0xff171717;
}
