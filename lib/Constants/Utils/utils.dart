import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:exercise_assignment/Constants/constants.dart';
import 'package:exercise_assignment/Elements/Widgets/Dialog/custom_dialog.dart';
import 'package:exercise_assignment/Elements/Widgets/toast.dart';
import 'package:exercise_assignment/Values/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../Elements/Widgets/spaces.dart';
import 'common_widgets.dart';

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
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static Widget showLoader({double? size}) {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColor.appTheme,
      ),
    );
  }

  static Future checkInternet({required void Function() onPositiveClick}) async {
    isInternetAvailable = await Utils.hasConnection();
    if (!isInternetAvailable) {
      await CustomDialog().showNoInternetDialog(
        positiveButtonText: MyString.tryAgain,
        negativeButtonText: MyString.cancel,
        onPositiveClick: () async => {Get.back(),await checkInternet(onPositiveClick: onPositiveClick )},
        onNegativeClick: () {
          Navigator.of(Get.context!).pop();
        },
      );
    } else {
      onPositiveClick();
    }
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

  static bool checkResponse({required int statusCode}) {
    if (statusCode == 200 || statusCode == 201) {
      return true;
    } else {
      showBottomToast(value: MyString.somethingWrong,);
      return false;
    }
  }

  static Future<bool> onWillPop() async {
    return warningDialog(
      positiveButtonText: MyString.yes,
      negativeButtonText: MyString.no,
      dialogTitle: MyString.areYouSure,
      dialogBody: MyString.exitDialogDetail,
      onNegativeClick: () => Navigator.of(Get.context!).pop(),
      onPositiveClick: () => SystemNavigator.pop(),
    );
  }

  static warningDialog(
      {String? dialogTitle,
        String? dialogBody,
        Widget? bodyWidget,
        String? negativeButtonText,
        String? positiveButtonText,
        Color? positiveButtonColor,
        Color? negativeButtonColor,
        bool isReverse = false,
        bool? barrierDismissible,
        bool? isSingleButton,
        TextStyle? titleStyle,
        void Function()? onNegativeClick,
        void Function()? onPositiveClick}) {
    final textStyle = TextStyles.profileTitleStyle
        .copyWith(color: MyColor.black, fontSize: Sizes.TEXT_SIZE_18);
    return CustomDialog().showCustomDialog(
      barrierDismissible: barrierDismissible,
      bottomColor: MyColor.white,
      dialogBody: dialogBody,
      bodyWidget: bodyWidget,
      dialogTitle: dialogTitle ?? MyString.areYouSure,
      negativeButtonText: negativeButtonText ?? MyString.cancel,
      positiveButtonText: positiveButtonText,
      titleStyle: titleStyle ?? textStyle.copyWith(color: MyColor.appTheme),
      bodyStyle: textStyle.copyWith(
          fontSize: Sizes.TEXT_SIZE_16, fontWeight: FontWeight.w400),
      onNegativeClick: onNegativeClick,
      onPositiveClick: onPositiveClick,
      buttonWidget: Column(
        children: [
          const SpaceH20(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal : Sizes.WIDTH_20, vertical: Sizes.HEIGHT_10),
            child: Row(
              mainAxisAlignment: isSingleButton ?? false ?  MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
              children: [
                CommonWidgets.commonButton(
                    width: Get.mediaQuery.size.width / 3.2,
                    title: negativeButtonText ?? MyString.cancel,
                    onTap: onNegativeClick ?? () => Get.back(),
                    borderColor:
                    isReverse ? MyColor.appTheme : MyColor.transparent,
                    bgColor: isReverse
                        ? MyColor.white
                        : MyColor.appTheme,
                    textColor: isReverse ? MyColor.appTheme : MyColor.white),
                isSingleButton ?? false ? const SizedBox.shrink() : CommonWidgets.commonButton(
                    width: Get.mediaQuery.size.width / 3.2,
                    title: positiveButtonText ?? MyString.save,
                    onTap: onPositiveClick ?? () => {},
                    borderColor:
                    isReverse ? MyColor.transparent : MyColor.appTheme,
                    bgColor: isReverse
                        ? MyColor.appTheme
                        : MyColor.white,
                    textColor: isReverse ? MyColor.white : MyColor.appTheme) ,
              ],
            ),
          ),
        ],
      ),
    );
  }

  static showBottomToast(
      {required String value,
        Color? backgroundColor,
        Color? textColor,
        int? duration,
        String? imagePath,
        double? backgroundRadius,
        Border? border,
        bool? rootNavigator}) {
    Toast.show(
      value,
      backgroundColor: backgroundColor ?? MyColor.appTheme,
      duration: Toast.lengthShort,
      gravity: Toast.bottom,
      backgroundRadius: backgroundRadius ?? Sizes.RADIUS_12,
      border: border,
      rootNavigator: rootNavigator,
      textAlign: TextAlign.center,
      textStyle: TextStyles.profileTitleStyle
          .copyWith(color: textColor ?? MyColor.white),
    );
  }

  static showWarningToast(
      {required String value,
        Color? backgroundColor,
        Color? textColor,
        int? duration,
        String? imagePath,
        double? backgroundRadius,
        Border? border,
        bool? rootNavigator}) {
    Toast.show(
      value,
      backgroundColor: backgroundColor ?? MyColor.appTheme,
      duration: Toast.lengthShort,
      gravity: Toast.bottom,
      backgroundRadius: backgroundRadius ?? Sizes.RADIUS_12,
      border: border,
      rootNavigator: rootNavigator,
      textAlign: TextAlign.center,
      textStyle: TextStyles.profileTitleStyle
          .copyWith(color: textColor ?? MyColor.white),
    );
  }



}
