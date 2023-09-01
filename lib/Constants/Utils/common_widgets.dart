import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Elements/Lib/flutter_shimmer/shimmer.dart';
import '../../Elements/Widgets/custom_button.dart';
import '../../Values/values.dart';

class CommonWidgets {
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
      textStyle: textStyle ??
          TextStyles.profileTitleStyle
              .copyWith(fontSize: Sizes.TEXT_SIZE_14, color: textColor),
    );
  }

  static shimmerWidget({Widget? child,double? height,double? width}) {
    return Shimmer.fromColors(
      baseColor: MyColor.blackShade3,
      highlightColor: MyColor.grey,
      child: child ??
          Container(
            height: height ?? Sizes.WIDTH_300,
            width: width ?? Sizes.WIDTH_300,
            color: MyColor.appTheme,
          ),
    );
  }

  static SliverAppBar appBar({required String title}) {
    return SliverAppBar(
      centerTitle: true,
      pinned: true,
      expandedHeight: Sizes.HEIGHT_130,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          title,
          style:
              TextStyles.titleTextStyle.copyWith(fontSize: Sizes.TEXT_SIZE_16),
          textAlign: TextAlign.center,
        ),
        background: ColorFiltered(
            colorFilter: ColorFilter.mode(
                MyColor.appTheme.withOpacity(0.6), BlendMode.darken),
            child: Image.asset(
              ImagePath.exerciseBgImage,
              fit: BoxFit.cover,
            )),
      ),
    );
  }

  static Widget bgImage({required String imagePath,double? height,double? width,bool? isColorFilter}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Sizes.WIDTH_10),
      child: ColorFiltered(
          colorFilter: isColorFilter ?? true ? ColorFilter.mode(
              MyColor.appTheme.withOpacity(0.6), BlendMode.darken) : const ColorFilter.mode(MyColor.transparent, BlendMode.color),
          child: Image.network(
            imagePath,
            errorBuilder: (context, error, stackTrace) =>
                Image.asset(ImagePath.exerciseBgImage),
            height: height ?? Sizes.WIDTH_300,
            width: width ?? Sizes.WIDTH_300,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return CommonWidgets.shimmerWidget(height: height,width: width);
              }
            },
          )),
    );
  }
}
