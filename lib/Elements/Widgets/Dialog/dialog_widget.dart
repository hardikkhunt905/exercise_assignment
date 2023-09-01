import 'package:flutter/material.dart';
import 'package:exercise_assignment/Elements/Widgets/spaces.dart';
import 'package:exercise_assignment/Values/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogWidget extends StatelessWidget {

  final double? height;
  final double? width;
  final Color? bottomColor;
  final Color? topColor;
  final String? topIcon;
  final Widget? titleWidget;
  final String? dialogTitle;
  final TextStyle? titleStyle;
  final Widget? bodyWidget;
  final String? dialogBody;
  final TextStyle? bodyStyle;
  final String? positiveButtonText;
  final String? negativeButtonText;
  final void Function() onPositiveClick;
  final void Function() onNegativeClick;


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
    required this.onPositiveClick,
    required this.onNegativeClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      elevation: 0,
      backgroundColor: MyColor.transparent,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) => Container(
        height: height ?? 350.h,
        // width: width ?? 350.h,
        decoration: Decorations.exitDialogBoxDecoration(
            color: bottomColor ?? Colors.redAccent,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
        child: Column(
          children: <Widget>[
            topIcon == null
                ? const SizedBox.shrink()
                : Container(
                    width: double.infinity,
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
                    ? Text(
                        dialogTitle!,
                        textAlign: TextAlign.center,
                        style: titleStyle ??
                            const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,),
                      )
                    : const SizedBox.shrink(),
            const SpaceH12(),
            bodyWidget != null
                ? bodyWidget!
                : dialogBody != null
                    ? Padding(
                        padding: EdgeInsets.only(right: 16.w, left: 16.w),
                        child: Text(
                          dialogBody!,
                          style: bodyStyle ?? const TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ))
                    : const SizedBox.shrink(),
            const SpaceH24(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(width: 100.w,
                  child: ElevatedButton(
                    style: ButtonStyle(),
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
            )
          ],
        ),
      );
}
