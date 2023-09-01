import 'package:flutter/material.dart';
import 'package:exercise_assignment/Elements/Widgets/Dialog/dialog_widget.dart';
import 'package:exercise_assignment/Values/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///
/// This is the Info dialog with 4 different varients as follows:
/// 1. Sucess (Green color)
/// 2. Normal (Blue color)
/// 3. Warning (Orange color)
/// 4. Error (Red color)
///
/// Also this dialog comes with 6 different animations:
/// 1. showAnimatedFromLeft
/// 2. showAnimatedFromRight
/// 3. showAnimatedFromTop
/// 4. showAnimatedFromBottom
/// 5. showAnimatedGrow
/// 6. showAnimatedShrink
///
/// Checkout online documentation for more information or example at https://pub.dev

class CustomDialog {
  ///
  /// This is CustomDialog without animation.
  ///
  /// for more information visit https://pub.dev
  ///
  static show({
    String? title,
    required String message,
    String image = '',
    String buttonText = 'OK',
    required VoidCallback onTapDismiss,
    PanaraDialogType panaraDialogType = PanaraDialogType.normal,
    bool barrierDismissible = true,
  }) =>
      Get.generalDialog(
          barrierDismissible: barrierDismissible,
          barrierLabel: '',
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return _CustomDialogWidget(
              title: title ?? "",
              message: message,
              image: image,
              buttonText: buttonText,
              onTapDismiss: onTapDismiss,
              barrierDismissible: barrierDismissible,
              panaraDialogType: panaraDialogType,
            );
          },
          transitionBuilder: (context, animation, secondaryAnimation, child) {
            return _Animations._grow(animation, secondaryAnimation, child);
          },
          transitionDuration: const Duration(milliseconds: 200));

/*showDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        builder: (context) => _CustomDialogWidget(
          title: title,
          message: message,
          image: image,
          buttonText: buttonText,
          onTapDismiss: onTapDismiss,
          panaraDialogType: panaraDialogType,
        ),
      );*/

  void showBottomDialog(
          {required Widget body,
          String? barrierLabel,
          bool? barrierDismissible,
          Color? barrierColor,
          Duration? transitionDuration}) =>
      showGeneralDialog(
        barrierLabel: barrierLabel ?? "Show Bottom GeneralDialog",
        barrierDismissible: barrierDismissible ?? true,
        barrierColor: barrierColor ?? MyColor.black.withOpacity(0.6),
        transitionDuration:
            transitionDuration ?? const Duration(milliseconds: 400),
        context: Get.context!,
        pageBuilder: (context, _, __) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: IntrinsicHeight(
              child: Container(
                width: double.maxFinite,
                clipBehavior: Clip.antiAlias,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Material(
                  child: body,
                ),
              ),
            ),
          );
        },
        transitionBuilder: (_, animation1, __, child) {
          return SlideTransition(
            position: Tween(
              begin: const Offset(0, 1),
              end: const Offset(0, 0),
            ).animate(animation1),
            child: child,
          );
        },
      );

  showCustomDialog({
    Key? key,
    double? height,
    Color? bottomColor,
    Color? topColor,
    String? topIcon,
    Widget? titleWidget,
    String? dialogTitle,
    TextStyle? titleStyle,
    Widget? bodyWidget,
    String? dialogBody,
    TextStyle? bodyStyle,
    String? positiveButtonText,
    String? negativeButtonText,
    required void Function() onPositiveClick,
    required void Function() onNegativeClick,
  }) =>
      showDialog(
          barrierDismissible: false,
          context: Get.context!,
          builder: (context) => DialogWidget(
                key: key,
                height: height,
                bottomColor: bottomColor,
                bodyWidget: bodyWidget,
                bodyStyle: bodyStyle,
                negativeButtonText: negativeButtonText,
                positiveButtonText: positiveButtonText,
                titleStyle: titleStyle,
                titleWidget: titleWidget,
                topColor: topColor,
                topIcon: topIcon,
                dialogTitle: dialogTitle,
                dialogBody: dialogBody,
                onPositiveClick: onPositiveClick,
                onNegativeClick: onNegativeClick,
              ));

  showUpdateDialog(
          {required Widget body,
          String? barrierLabel,
          bool? barrierDismissible,
          Color? barrierColor,
          Duration? transitionDuration}) =>
      CustomDialog().showBottomDialog(
          barrierDismissible: barrierDismissible,
          body: body,
          barrierColor: barrierColor,
          barrierLabel: barrierLabel,
          transitionDuration: transitionDuration);
}

class CustomConfirmDialog {
  ///
  /// This is CustomConfirmDialog without animation.
  ///
  /// for more information visit https://pub.dev
  ///
  static show({
    required String title,
    required String message,
    String image = '',
    String confirmButtonText = 'Yes',
    String cancelButtonText = 'No',
    required VoidCallback onTapConfirm,
    VoidCallback? onTapCancel,
    PanaraDialogType panaraDialogType = PanaraDialogType.normal,
    bool barrierDismissible = true,
  }) =>
      Get.generalDialog(
          pageBuilder: (context, animation, secondaryAnimation) {
            return _CustomConfirmDialogWidget(
              title: title,
              message: message,
              image: image,
              confirmButtonText: confirmButtonText,
              cancelButtonText: cancelButtonText,
              onTapConfirm: onTapConfirm,
              onTapCancel: onTapCancel,
              panaraDialogType: panaraDialogType,
              barrierDismissible: barrierDismissible,
            );
          },
          barrierDismissible: false,
          transitionBuilder:
              (context, _animation, _secondaryAnimation, _child) {
            return _Animations._fromBottom(
                _animation, _secondaryAnimation, _child);
          },
          transitionDuration: Duration(milliseconds: 200));
/*showDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        builder: (context) => _CustomConfirmDialogWidget(
          title: title,
          message: message,
          image: image,
          confirmButtonText: confirmButtonText,
          cancelButtonText: cancelButtonText,
          onTapConfirm: onTapConfirm,
          onTapCancel: onTapCancel,
          panaraDialogType: panaraDialogType,
          barrierDismissible: barrierDismissible,
        ),
      );*/

}

///
/// This is the Button widget used in both dialogs.
///
///
class _PanaraButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color bgColor;
  final bool isOutlined;

  const _PanaraButton({
    Key? key,
    required this.text,
    this.onTap,
    required this.bgColor,
    required this.isOutlined,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isOutlined ? Colors.white : bgColor,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 43,
          decoration: BoxDecoration(
            border: isOutlined ? Border.all(color: bgColor) : null,
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
          ),
          alignment: Alignment.center,
          child: Text(
            text.tr,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: isOutlined ? bgColor : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

///
/// These are the 4 Variants for both Dialogs.
///
/// for more information visit https://pub.dev
///
enum PanaraDialogType {
  success,
  normal,
  warning,
  error,
}

///
/// This is the animation class containing all the animations for both dialogs.
///
class _Animations {
  // slide animation from right to left
  // we need animation of type double
  static _fromLeft(Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(end: Offset.zero, begin: const Offset(1.0, 0.0))
          .animate(animation),
      child: child,
    );
  }

  // slide animation from left to right
  static _fromRight(Animation<double> _animation,
      Animation<double> _secondaryAnimation, Widget _child) {
    return SlideTransition(
      child: _child,
      position: Tween<Offset>(end: Offset.zero, begin: const Offset(-1.0, 0.0))
          .animate(_animation),
    );
  }

  // slide animation from top to bottom
  static _fromTop(Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(end: Offset.zero, begin: const Offset(0.0, -1.0))
          .animate(animation),
      child: child,
    );
  }

  // slide animation from bottom to top
  static _fromBottom(Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(end: Offset.zero, begin: const Offset(0.0, 1.0))
          .animate(animation),
      child: child,
    );
  }

  // slide animation with grow effect
  static _grow(Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return ScaleTransition(
      scale: Tween<double>(end: 1.0, begin: 0.0).animate(
        CurvedAnimation(
          parent: animation,
          curve: const Interval(
            0.00,
            0.50,
            curve: Curves.linear,
          ),
        ),
      ),
      child: child,
    );
  }

  // slide animation with shrink effect
  static _shrink(Animation<double> _animation,
      Animation<double> _secondaryAnimation, Widget _child) {
    return ScaleTransition(
      child: _child,
      scale: Tween<double>(end: 1.0, begin: 1.2).animate(
        CurvedAnimation(
          parent: _animation,
          curve: const Interval(0.50, 1.00, curve: Curves.linear),
        ),
      ),
    );
  }
}

///
/// This is the CustomDialogWidget.
///
class _CustomDialogWidget extends StatelessWidget {
  final String title;
  final String message;
  final String image;
  final String buttonText;
  final VoidCallback onTapDismiss;
  final PanaraDialogType panaraDialogType;
  final bool barrierDismissible;

  const _CustomDialogWidget({
    Key? key,
    required this.title,
    required this.message,
    required this.image,
    required this.buttonText,
    required this.onTapDismiss,
    required this.panaraDialogType,
    this.barrierDismissible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (image.isNotEmpty)
                Image.asset(
                  image,
                  width: 84,
                  height: 84,
                  color: panaraDialogType == PanaraDialogType.normal
                      ? MyColor.buttonColor
                      : panaraDialogType == PanaraDialogType.success
                          ? MyColor.buttonColor
                          : panaraDialogType == PanaraDialogType.warning
                              ? MyColor.buttonColor
                              : MyColor.buttonColor,
                ),
              if (image.isNotEmpty)
                const SizedBox(
                  height: 20,
                ),
              Text(
                title.tr,
                style: TextStyle(
                  fontSize: 20.sp,
                  height: 1.2,
                  fontWeight: FontWeight.w600,
                  //color: MyColor().textColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                message.tr,
                style: TextStyle(
                  //color: MyColor().textColor,
                  height: 1.5,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              _PanaraButton(
                text: buttonText,
                onTap: onTapDismiss,
                bgColor: panaraDialogType == PanaraDialogType.normal
                    ? MyColor.buttonColor
                    : panaraDialogType == PanaraDialogType.success
                        ? MyColor.buttonColor
                        : panaraDialogType == PanaraDialogType.warning
                            ? MyColor.buttonColor
                            : MyColor.buttonColor,
                isOutlined: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

///
/// This is the CustomConfirmDialogWidget.
///
class _CustomConfirmDialogWidget extends StatelessWidget {
  final String title;
  final String message;
  final String image;
  final String confirmButtonText;
  final String cancelButtonText;
  final VoidCallback onTapConfirm;
  final VoidCallback? onTapCancel;
  final PanaraDialogType panaraDialogType;
  final bool barrierDismissible;

  const _CustomConfirmDialogWidget({
    Key? key,
    required this.title,
    required this.message,
    required this.image,
    required this.confirmButtonText,
    required this.cancelButtonText,
    required this.onTapConfirm,
    this.onTapCancel,
    required this.panaraDialogType,
    required this.barrierDismissible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (image.isNotEmpty)
                Image.asset(
                  image,
                  width: 84,
                  height: 84,
                  color: panaraDialogType == PanaraDialogType.normal
                      ? MyColor.buttonColor
                      : panaraDialogType == PanaraDialogType.success
                          ? MyColor.buttonColor
                          : panaraDialogType == PanaraDialogType.warning
                              ? MyColor.buttonColor
                              : MyColor.buttonColor,
                ),
              if (image.isNotEmpty)
                const SizedBox(
                  height: 20,
                ),
              Text(
                title.tr,
                style: TextStyle(
                  fontSize: 20.sp,
                  height: 1.2,
                  fontWeight: FontWeight.w600,
                  color: MyColor.buttonColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                message.tr,
                style: TextStyle(
                  //color: MyColor().textColor,
                  height: 1.5,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 28,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: _PanaraButton(
                      onTap: onTapCancel == null
                          ? () {
                              Get.back();
                            }
                          : onTapCancel,
                      text: cancelButtonText,
                      bgColor: panaraDialogType == PanaraDialogType.normal
                          ? MyColor.buttonColor
                          : panaraDialogType == PanaraDialogType.success
                              ? MyColor.buttonColor
                              : panaraDialogType == PanaraDialogType.warning
                                  ? MyColor.buttonColor
                                  : MyColor.buttonColor,
                      isOutlined: true,
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    flex: 1,
                    child: _PanaraButton(
                      onTap: onTapConfirm,
                      text: confirmButtonText,
                      bgColor: panaraDialogType == PanaraDialogType.normal
                          ? MyColor.buttonColor
                          : panaraDialogType == PanaraDialogType.success
                              ? MyColor.buttonColor
                              : panaraDialogType == PanaraDialogType.warning
                                  ? MyColor.buttonColor
                                  : MyColor.buttonColor,
                      isOutlined: false,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Custom_Comman_AlertDialog {
  ///
  /// This is CustomDialog without animation.
  ///
  /// for more information visit https://pub.dev
  ///
  static show(
          {required String title,
          required String message,
          String image = '',
          String buttonText = 'OK',
          required VoidCallback onTap,
          VoidCallback? onCloseTap,
          PanaraDialogType panaraDialogType = PanaraDialogType.normal,
          bool barrierDismissible = true,
          bool isResultDialog = false,
          double? messageFontSize,
          double? titleFontSize}) =>
      Get.generalDialog(
          barrierDismissible: false,
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return _Custom_Comman_AlertDialog(
              title: title,
              message: message,
              image: image,
              buttonText: buttonText,
              messageFontSize: messageFontSize,
              titleFontSize: titleFontSize,
              panaraDialogType: panaraDialogType,
              onClick: onTap,
              isResultDialog: isResultDialog,
              onCloseTap: onCloseTap,
            );
          },
          transitionBuilder:
              (context, _animation, _secondaryAnimation, _child) {
            return _Animations._fromBottom(
                _animation, _secondaryAnimation, _child);
          },
          transitionDuration: Duration(milliseconds: 200));
/*showDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        builder: (context) => _CustomDialogWidget(
          title: title,
          message: message,
          image: image,
          buttonText: buttonText,
          onTapDismiss: onTapDismiss,
          panaraDialogType: panaraDialogType,
        ),
      );*/

}

class _Custom_Comman_AlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final String image;
  final String buttonText;
  final VoidCallback onClick;
  final VoidCallback? onCloseTap;
  final PanaraDialogType panaraDialogType;
  final bool barrierDismissible;
  final bool isResultDialog;
  double? messageFontSize;
  double? titleFontSize;

  _Custom_Comman_AlertDialog({
    Key? key,
    required this.title,
    this.messageFontSize,
    required this.message,
    required this.image,
    required this.buttonText,
    required this.onClick,
    required this.panaraDialogType,
    this.barrierDismissible = true,
    this.isResultDialog = false,
    this.titleFontSize,
    required this.onCloseTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.all(25),
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color: panaraDialogType == PanaraDialogType.error
                      ? MyColor.buttonColor
                      : MyColor.buttonColor,
                  width: 3)),
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            fit: StackFit.loose,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (image.isNotEmpty)
                    Container(
                        padding: EdgeInsets.all(10),
                        child: Image.asset(image, width: 65, height: 65)),
                  Text(
                    title.tr,
                    style: TextStyle(
                        fontSize: titleFontSize ?? 14.sp,
                        height: 1.2,
                        fontWeight: FontWeight.w500,
                        color: panaraDialogType == PanaraDialogType.normal
                            ? MyColor.buttonColor
                            : panaraDialogType == PanaraDialogType.success
                                ? MyColor.buttonColor
                                : panaraDialogType == PanaraDialogType.warning
                                    ? MyColor.buttonColor
                                    : MyColor.buttonColor,
                        fontFamily: "QuickSand"),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    message.tr,
                    style: TextStyle(
                        fontSize: messageFontSize ??
                            (isResultDialog == true ? 24.sp : 18.sp),
                        height: 1.2,
                        fontWeight: FontWeight.w600,
                        color: MyColor.buttonColor,
                        fontFamily: "QuickSand"),
                    textAlign: TextAlign.center,
                    maxLines: isResultDialog == true ? 1 : 2,
                  ),
                  SizedBox(
                    height: 4.8.h,
                    width: 50.w,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            textStyle: MaterialStateProperty.all(TextStyle(
                                color: MyColor.buttonColor,
                                fontSize: 18.sp,
                                fontFamily: "QuickSand",
                                fontWeight: FontWeight.w500)),
                            backgroundColor:
                                MaterialStateProperty.all(MyColor.buttonColor),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)))),
                        onPressed: onClick,
                        child: Text(buttonText)),
                  )
                ],
              ),

              panaraDialogType == PanaraDialogType.error
                  ? GestureDetector(
                      onTap: onCloseTap ?? () {},
                      child: Icon(Icons.close,
                          size: 22, color: MyColor.buttonColor))
                  : SizedBox.shrink(),

              isResultDialog == true
                  ? GestureDetector(
                      onTap: onCloseTap ?? () {},
                      child: Icon(Icons.close,
                          size: 22,
                          color: panaraDialogType == PanaraDialogType.error &&
                                  isResultDialog == true
                              ? MyColor.buttonColor
                              : MyColor.buttonColor),
                    )
                  : SizedBox.shrink(),

              // Row(mainAxisAlignment: MainAxisAlignment.end,
              // children: [
              //
              // ],),
            ],
          ),
        ),
      ),
    );
  }
}
