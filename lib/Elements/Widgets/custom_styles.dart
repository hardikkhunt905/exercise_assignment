import 'package:flutter/material.dart';
import 'package:exercise_assignment/Constants/constants.dart';
import 'package:exercise_assignment/Constants/Utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomStyles {
  static TextStyle textStyle(
      {String? fontFamily,
      double? fontSize,
      Color? fontColor,
        TextDecoration? textDecoration,
        FontStyle? fontStyle,
      FontWeight? fontWeight}) {
    return TextStyle(
        fontFamily: fontFamily ?? uiFontFamily,
        fontStyle: fontStyle,
        decoration: textDecoration,
        fontSize: fontSize ?? (Utils.isTablet ?  20.sp : 15.sp),
        color: fontColor,
        fontWeight: fontWeight);
  }
}
