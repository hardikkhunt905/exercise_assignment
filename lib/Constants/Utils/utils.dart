import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:exercise_assignment/Constants/constants.dart';
import 'package:exercise_assignment/Elements/Widgets/Dialog/custom_dialog.dart';
import 'package:exercise_assignment/Elements/Widgets/Dialog/update_dialog.dart';
import 'package:exercise_assignment/Elements/Widgets/toast.dart';
import 'package:exercise_assignment/Values/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../preferences.dart';

class Utils {
  static late final bool isTablet;
  static bool isInternetAvailable = false;
  static ValueNotifier<Locale> appLocal = ValueNotifier(const Locale('en', ''));

  static Future<bool> hasConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isInternetAvailable = true;
        Debug.setLog("Internet available");
        return true;
      }
    } on SocketException catch (_) {
      isInternetAvailable = false;
      Debug.setLog("Internet not available");
      return false;
    }
    Debug.setLog("Internet not available");
    isInternetAvailable = false;
    return false;
  }

  static dateToday() {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    return date;
  }

  static dateTimeToDate({required DateTime dateTime}) {
    var date = DateFormat("y-MM-dd").format(dateTime);
    Debug.setLog(date);
    return date;
  }

  static showSnackBar(String value) {
    Get.showSnackbar(
      GetSnackBar(
        title: "",
        message: value.tr,
        isDismissible: true,
        padding: EdgeInsets.all(10.w),
        titleText: Container(),
        duration: Duration(seconds: 3),
      ),
    );
  }

  static Future checkInternet() async {
    isInternetAvailable = await Utils.hasConnection();
    if (!isInternetAvailable) {
      // await CustomDialog().showNoInternetDialog(
      //   positiveButtonText: MyString.retry,
      //   onPositiveClick: () async {
      //     if(isInternetAvailable){
      //       Navigator.of(Get.context!).pop(true);
      //     }else{
      //       Navigator.of(Get.context!).pop(true);
      //       await checkInternet();
      //     }
      //   },
      //   onNegativeClick: () {
      //     Navigator.of(Get.context!).pop();
      //   },
      // );
    }
  }

  static showExitDialog() {}

  static Future countData(
      {required int adCounts,
      required String key,
      required bool? isRun}) async {
    if (isRun != null && isRun) {
      int count = await Preferences.getPrefInteger(key);

      if (count < adCounts) {
        count++;
        await Preferences.setPrefInteger(key, count);

        Utils.showToast(value: "$count / $adCounts - $key");
        Debug.setLog("$key -> ${count.toString()}");
        return false;
      } else {
        Utils.showToast(value: "0 / $adCounts - $key");
        await Preferences.setPrefInteger(key, 0);
        return true;
      }
    }
    return false;
  }

  static showToast(
      {required String value,
      Color? backgroundColor,
      Color? textColor,
      int? duration,
      String? imagePath,
      double? backgroundRadius,
      Border? border,
      bool? rootNavigator}) {
    if (countToastDebug) {
      Toast.show(
        value,
        backgroundColor: backgroundColor ?? Colors.black,
        duration: Toast.lengthShort,
        gravity: Toast.bottom,
        backgroundRadius: backgroundRadius ?? 20,
        border: border,
        rootNavigator: rootNavigator,
        textStyle:
            TextStyle(color: textColor ?? MyColor.white, fontSize: 18.sp),
      );
    }
    // ToastUtil.show(
    // duration: duration ?? 2,
    //     ToastDecorator(
    //       widget: Wrap(alignment: WrapAlignment.center,crossAxisAlignment: WrapCrossAlignment.center,
    //         children: [
    //           Image.asset(imagePath ?? ImagePath.appLogo,height: 25.w,width: 25.w,),
    //           const SpaceW12(),
    //           Text(
    //               value,
    //               style: TextStyle(color: Colors.white,fontSize: 18.sp)
    //           ),
    //         ],
    //       ),
    //       backgroundColor: backgroundColor ?? Colors.black,
    //     ),
    //     context,
    //     gravity: ToastGravity.bottom);
  }


}
