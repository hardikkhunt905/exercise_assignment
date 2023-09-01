import 'dart:developer' as d;
import 'package:exercise_assignment/Values/values.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

const debug = true;
const countToastDebug = false;
const inDevelopment = true;

const uiFontFamily = 'Roboto';

var logger = Logger();

double screenWidth = ScreenUtil().screenWidth;
double screenHeight = ScreenUtil().screenWidth;
double screenHeightOrg = ScreenUtil().screenHeight;

// Arguments
const exerciseIdArg = "Exercise Arguments";



class Debug {
  static void setLog(String val){
    if(debug) logger.d(val);
  }
  static void setErrorLog(String val){
    if(debug) logger.e(val);
  }
}

showOverlayProgressBar({Future Function()? close}){
  Get.showOverlay(asyncFunction: close!,loadingWidget: const Center(
    child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(MyColor.blue),backgroundColor:Colors.white),
  ),);
}


class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}