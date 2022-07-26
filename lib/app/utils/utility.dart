// coverage:ignore-file

// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'dart:io' show Directory;
import 'dart:math';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:my_application/app/app.dart';
import 'package:my_application/domain/domain.dart';

abstract class Utility {
  static Directory path = Directory('storage/emulated/0/Fanzly');

  // coverage:ignore-start
  static void printDLog(String message) {
    Logger().d('${StringConstants.appName}: $message');
  }

  /// Print info log.
  ///
  /// [message] : The message which needed to be print.
  static void printILog(dynamic message) {
    Logger().i('${StringConstants.appName}: $message');
  }

  /// Print info log.
  ///
  /// [message] : The message which needed to be print.
  static void printLog(dynamic message) {
    Logger().log(Level.info, message);
  }

  /// Get First word of a name.
  ///
  static String? getNameInitials(String? firstName, String? lastName) =>
      '${firstName![0]}${lastName![0]}'.toUpperCase();

  /// Print error log.
  ///
  /// [message] : The message which needed to be print.
  static void printELog(String message) {
    Logger().e('${StringConstants.appName}: $message');
  }

  static String? validatePassword(String value) {
    if (value.trim().isNotEmpty) {
      if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
        if (value.contains(RegExp(r'[A-Z]'))) {
          if (value.contains(RegExp(r'[0-9]'))) {
            if (value.length < 6) {
              return 'shouldBe6Characters'.tr;
            } else {
              return null;
            }
          } else {
            return 'shouldHaveOneDigit'.tr;
          }
        } else {
          return 'shouldHaveOneUppercaseLetter'.tr;
        }
      } else {
        return 'shouldHaveOneSpecialCharacter'.tr;
      }
    } else {
      return 'passwordRequired'.tr;
    }
  }

  /// Returns true if email is Valid
  static bool emailValidator(String email) => EmailValidator.validate(email);

  /// Check if URL is valid
  static bool urlValidator(String value) {
    var pattern =
        r'((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?';
    var regExp = RegExp(pattern);
    if (value.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  /// Returns true if the internet connection is available.
  static Future<bool> isNetworkAvailable() async =>
      await InternetConnectionChecker().hasConnection;

  /// Print the details of the [response].
  static void printResponseDetails(Response? response) {
    if (response != null) {
      var isOkay = response.isOk;
      var statusCode = response.statusCode;
      var statusText = response.statusText;
      var method = response.request?.method ?? '';
      var path = response.request?.url.path ?? '';
      var query = response.request?.url.queryParameters ?? '';
      if (isOkay) {
        printILog(
            'Path: $path, Method: $method, Status Text: $statusText, Status Code: $statusCode, Query $query');
      } else {
        printELog(
            'Path: $path, Method: $method, Status Text: $statusText, Status Code: $statusCode, Query $query');
      }
    }
  }

  /// returns the date time in particular given formate
  static String getWeekDayMonthNumYear(DateTime dateTime) =>
      DateFormat.yMMMMEEEEd().format(dateTime);

  /// get formated [DateTime] eg. 12-01-2021
  static String getDayMonthYear(DateTime dateTime) =>
      '${getOnlyDate(dateTime)}-${DateFormat('MM').format(dateTime)}-${DateFormat.y().format(dateTime)}';

  /// get formated [DateTime] eg. 12
  static String getOnlyDate(DateTime dateTime) =>
      DateFormat('dd').format(dateTime);

  /// get formated [DateTime] eg. 12 Sep
  static String getDateAndMonth(DateTime dateTime) =>
      DateFormat('dd MMM').format(dateTime);

  /// get formated [DateTime]
  static String getWeekDay(DateTime dateTime) =>
      DateFormat.EEEE().format(dateTime);

  /// Calculates number of weeks for a given year as per https://en.wikipedia.org/wiki/ISO_week_date#Weeks_per_year
  static int _numOfWeeks(int year) {
    var dec28 = DateTime(year, 12, 28);
    var dayOfDec28 = int.parse(DateFormat('D').format(dec28));
    return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
  }

  // Calculates week number from a date as per https://en.wikipedia.org/wiki/ISO_week_date#Calculation
  static int weekNumber(DateTime date) {
    var dayOfYear = int.parse(DateFormat('D').format(date));
    var woy = ((dayOfYear - date.weekday + 10) / 7).floor();
    if (woy < 1) {
      woy = _numOfWeeks(date.year - 1);
    } else if (woy > _numOfWeeks(date.year)) {
      woy = 1;
    }
    return woy;
  }

  /// Close loader
  static void closeLoader() {
    closeDialog();
  }

  /// Show info dialog
  static void showDialog(
    String message, {
    Function()? onPress,
    bool barrierDismissible = true,
  }) async {
    await Get.dialog<void>(
      CupertinoAlertDialog(
        title: const Text('Info'),
        content: Text(
          message,
        ),
        actions: [
          CupertinoButton(
            onPressed: onPress ?? Get.back,
            child: Text(
              'Okay',
              style: TextStyle(color: Theme.of(Get.context!).primaryColor),
            ),
          ),
        ],
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  /// Show alert dialog
  static void showAlertDialog({
    String? message,
    String? title,
    Function()? onPress,
  }) async {
    await Get.dialog<void>(
      CupertinoAlertDialog(
        title: Text('$title'),
        content: Text('$message'),
        actions: <Widget>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: onPress,
            child: const Text('Yes'),
          ),
          const CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: closeDialog,
            child: Text('No'),
          )
        ],
      ),
    );
  }

  /// Close any open dialog.
  static void closeDialog() {
    // if (Get.isDialogOpen ?? false) Get.back<dynamic>();
    debugPrint('Start: Close Dialog ${Get.isDialogOpen}');
    if (Get.isDialogOpen ?? true) {
      //   // Navigator.of(Get.context!, rootNavigator: true);
      Get.back<void>();
    }
    debugPrint('End: Close Dialog ${Get.isDialogOpen}');
  }

  /// Close any open snackbar
  static void closeSnackbar() {
    if (Get.isSnackbarOpen) {
      Get.back<void>();
    }
  }

  /// Returns Platform type
  static String platFormType() {
    var value = kIsWeb
        ? 3
        : GetPlatform.isAndroid
            ? 1
            : 2;
    return value.toString();
  }

  /// Random number generator
  static int getRandomNumer() {
    var random = Random();
    return random.nextInt(100);
  }

  /// Return file size
  static String getFileSize(int size) {
    if (size == 0) {
      return '0 KB';
    } else {
      var val = size / pow(1024, (log(size) / log(1024)).floor());
      if (size < 1024) {
        return '$val KB';
      } else {
        return '${val.toStringAsFixed(1)} MB';
      }
    }
  }

  /// calculate percentage
  static int getPercentageValue(int propotionateValue, int totalValue) =>
      ((propotionateValue / totalValue) * 100).round();

  static String getFormatedDate(String date) {
    var date = DateTime.parse('2018-04-10T04:00:00.000Z');
    return Utility.getDayMonthYear(date);
  }

  /// Show error dialog from response model
  static void showInfoDialog(ResponseModel data,
      [bool isSuccess = false, Function()? onPress]) async {
    await Get.dialog<dynamic>(
      CupertinoAlertDialog(
        title: Text(isSuccess ? 'SUCCESS' : 'ERROR'),
        content: Text(
          jsonDecode(data.data)['message'] as String,
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: onPress ?? Get.back,
            isDefaultAction: true,
            child: Text(
              'okay'.tr,
            ),
          ),
        ],
      ),
    );
  }

  /// Bottomsheet to show only alerts to user.
  static void showInfoBottomSheet({
    Widget? icon,
    String? title,
    double? titleSize,
    String? subTitle,
    double? subTitleSize,
    Widget? actions,
    bool isdismissible = true,
    Function()? afterDismissFunction,
  }) =>
      Get.bottomSheet<void>(
        Padding(
          padding: Dimens.edgeInsets16_25_16_0,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                icon ?? Dimens.box0,
                Dimens.boxHeight20,
                Text(
                  '$title',
                  style: titleSize != null
                      ? Styles.blackBold26.copyWith(fontSize: titleSize)
                      : Styles.blackBold26,
                ),
                if (subTitle != null) Dimens.boxHeight20,
                if (subTitle != null)
                  Text(
                    subTitle,
                    style: subTitleSize != null
                        ? Styles.black16.copyWith(fontSize: subTitleSize)
                        : Styles.black16,
                  ),
                Dimens.boxHeight30,
                actions ?? Dimens.box0,
                Dimens.boxHeight10,
              ],
            ),
          ),
        ),
        isScrollControlled: true,
        backgroundColor: Theme.of(Get.context!).canvasColor,
        isDismissible: isdismissible,
        enableDrag: isdismissible,
      ).then<void>(
        (_) {
          if (afterDismissFunction != null) {
            return afterDismissFunction();
          }
          return null;
        },
      );

  static String imageOptimization({
    required String bucket,
    required String key,
    required int width,
    required int height,
    required int quality,
    required bool progressive,
    required bool mozjpeg,
    required int blur,
  }) {
    var map = '';
    if (blur == 0) {
      map =
          '{"bucket": "$bucket","key": "$key","edits": {"resize": {"width": $width},"jpeg": {"quality": $quality,"progressive": $progressive,"mozjpeg": $mozjpeg}}}';
    } else {
      map =
          '{"bucket": "$bucket","key": "$key","edits": {"resize": {"width": $width},"jpeg": {"quality": $quality,"progressive": $progressive,"mozjpeg": $mozjpeg},"blur": $blur}}';
    }
    var data = base64Encode(utf8.encode(map));
    return data;
  }

  static String imageOptimizationWithoutSize({
    required String bucket,
    required String key,
    required int quality,
    required bool progressive,
    required bool mozjpeg,
    required int blur,
  }) {
    var map = '';
    if (blur == 0) {
      map =
          '{"bucket": "$bucket","key": "$key","edits": {"jpeg": {"quality": $quality,"progressive": $progressive,"mozjpeg": $mozjpeg}}}';
    } else {
      map =
          '{"bucket": "$bucket","key": "$key","edits": {"jpeg": {"quality": $quality,"progressive": $progressive,"mozjpeg": $mozjpeg},"blur": $blur}}';
    }
    var data = base64Encode(utf8.encode(map));
    return data;
  }

  static void getReadMoreSheet({String? title, String? text}) {
    Get.bottomSheet<dynamic>(
      SafeArea(
        child: Container(
          height: Dimens.twoHundredEighty,
          constraints: const BoxConstraints(maxHeight: double.infinity),
          width: double.infinity,
          color: ColorsValue.greyColor,
          child: Padding(
            padding: Dimens.edgeInsets15_20_15_0,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Styles.white23,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back<void>();
                        },
                        child: const Icon(
                          Icons.cancel,
                        ),
                      ),
                    ],
                  ),
                  Dimens.boxHeight30,
                  Text(
                    text!,
                    style: Styles.white14,
                  ),
                  Dimens.boxHeight10,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
