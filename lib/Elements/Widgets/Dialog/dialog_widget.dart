import 'package:flutter/material.dart';
import 'package:exercise_assignment/Elements/Widgets/spaces.dart';
import 'package:exercise_assignment/Values/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';



class DialogWidget extends StatelessWidget {

  final double? height;
  final double? width;
  final Color? bottomColor;
  final Color? topColor;
  final String? topIcon;
  final Widget? titleWidget;
  final Widget? buttonWidget;
  final String? dialogTitle;
  final TextStyle? titleStyle;
  final Widget? bodyWidget;
  final String? dialogBody;
  final TextStyle? bodyStyle;
  final String? positiveButtonText;
  final String? negativeButtonText;
  final bool? isButton;
  final bool? barrierDismissible;
  final void Function()? onPositiveClick;
  final void Function()? onNegativeClick;
  final EdgeInsetsGeometry? padding;


  const DialogWidget({
    Key? key,
    this.height,
    this.width,
    this.bottomColor,
    this.topColor,
    this.topIcon,
    this.titleWidget,
    this.titleStyle,
    this.dialogTitle,
    this.bodyWidget,
    this.bodyStyle,
    this.dialogBody,
    this.positiveButtonText,
    this.negativeButtonText,
    this.onPositiveClick,
    this.onNegativeClick, this.isButton, this.buttonWidget, this.barrierDismissible, this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: _buildChild(context), onWillPop: () async => barrierDismissible ?? false,);
  }

  _buildChild(BuildContext context) => Container(
    width: width ?? Get.mediaQuery.size.width,
    // height: height ?? 350.h,
    decoration: Decorations.exitDialogBoxDecoration(
        color: bottomColor ?? Colors.redAccent,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(12.r))),
    child: Padding(
      padding: padding ??  EdgeInsets.symmetric(vertical: Sizes.HEIGHT_20),
      child: Wrap(
        children: <Widget>[
          topIcon == null
              ? const SizedBox.shrink()
              : Container(
            decoration: Decorations.exitDialogBoxDecoration(
                color: topColor ?? Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12))),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset(
                topIcon!,
                height: 120.h,
                width: 120.w,
              ),
            ),
          ),
          const SpaceH20(),
          titleWidget != null
              ? titleWidget!
              : dialogTitle != null
              ? Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Sizes.WIDTH_10),
                  child: Text(
                    dialogTitle!,
                    textAlign: TextAlign.center,
                    style: titleStyle ??
                        const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,),
                  ),
                ),
                const SpaceH20()
              ],
            ),
          )
              : const SizedBox.shrink(),
          const SpaceH12(),
          bodyWidget != null
              ? bodyWidget!
              : dialogBody != null
              ? Center(
            child: Text(
              dialogBody!,
              style: bodyStyle ?? const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          )
              : const SizedBox.shrink(),
          const SpaceH24(),
          isButton ?? false ? Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(width: 100.w,
                  child: ElevatedButton(
                    style: const ButtonStyle(),
                    onPressed: onNegativeClick,
                    child: Text(negativeButtonText ?? MyString.exit,
                      style: const TextStyle(color: MyColor.white),),
                  ),
                ),
                const SpaceW12(),
                SizedBox(width: 100.w,
                  child: ElevatedButton(
                    onPressed: onPositiveClick,
                    child: Text(positiveButtonText ?? MyString.confirm,
                      style: const TextStyle(color: MyColor.white),),
                    // color: Colors.white, textColor: Colors.redAccent
                  ),
                )
              ],
            ),
          ) : buttonWidget ?? const SizedBox.shrink()
        ],
      ),
    ),
  );
}
