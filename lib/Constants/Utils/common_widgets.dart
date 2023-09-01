import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Elements/Lib/flutter_shimmer/shimmer.dart';
import '../../Elements/Widgets/custom_button.dart';
import '../../Values/values.dart';

class CommonWidgets{

  static Widget commonButton({
    required String title,
    required void Function() onTap,
    required Color bgColor,
    required Color borderColor,
    Color? textColor,
    double? width,
    TextStyle? textStyle,
    double? height,
  }) {
    return CustomButton(
      width: width ?? Get.mediaQuery.size.width / 2.5,
      radius: Sizes.RADIUS_6,
      title: title,
      height: height ?? Sizes.HEIGHT_40,
      onTap: onTap,
      bgColor: bgColor,
      borderWidth: 1,
      padding: EdgeInsets.zero,
      borderColor: borderColor,
      textStyle: textStyle ?? TextStyles.profileTitleStyle
          .copyWith(fontSize: Sizes.TEXT_SIZE_14, color: textColor),
    );
  }

  static shimmerWidget({Widget? child}){
    return Shimmer.fromColors(
      baseColor: MyColor.blackShade3,
      highlightColor: MyColor.grey,
      child: child ?? Container(
        height: Sizes.WIDTH_300,
        width: Sizes.WIDTH_300,
        color: MyColor.appTheme,
      ),
    );
  }
}