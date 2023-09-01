import 'package:flutter/material.dart';
import 'package:exercise_assignment/Constants/Utils/utils.dart';
import 'package:exercise_assignment/Elements/Widgets/spaces.dart';
import 'package:exercise_assignment/Values/values.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final double? radius;
  final Function onTap;
  final Color bgColor;
  final double elevation;
  final Color fgColor;
  final Color? pressedColor;
  final String title;
  final double borderWidth;
  final Color borderColor;
  final Size? size;
  final double? width;
  final double? height;
  final bool shrink;

  const CustomButton(
      {Key? key,
        required this.title,
        this.radius,
        this.borderWidth = 0,
        this.borderColor = Colors.transparent,
        this.padding,
        this.textStyle,
        required this.onTap,
        this.bgColor = MyColor.buttonColor,
        this.elevation = 0,
        this.pressedColor,
        this.size,
        this.width,
        this.height,
        this.shrink = false,
        this.fgColor = MyColor.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () => onTap(),
        clipBehavior: Clip.antiAlias,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(bgColor),
          foregroundColor: MaterialStateProperty.all(fgColor),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          side: MaterialStateProperty.all(BorderSide(
              color: borderColor, style: BorderStyle.solid, width: borderWidth)),
          elevation: MaterialStateProperty.all(elevation),
          padding: MaterialStateProperty.all(
              padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
          overlayColor: MaterialStateProperty.all(pressedColor ?? MyColor.appTheme.withOpacity(0.1)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 30))),
          animationDuration: const Duration(milliseconds: 500),
          splashFactory: InkSplash.splashFactory,
          maximumSize: shrink
              ? null
              : MaterialStateProperty.all(
              size ?? (Utils.isTablet ? Size(120.w, 48.h) : Size(60.w, 48.h))),
          minimumSize: shrink
              ? null
              : MaterialStateProperty.all(
              size ?? (Utils.isTablet ? Size(120.w, 48.h) : Size(60.w, 48.h))),
          visualDensity: VisualDensity.standard,
          // padding: MaterialStateProperty.all(EdgeInsets.all(20)),
          // surfaceTintColor:  MaterialStateProperty.all(Colors.greenAccent)
        ),
        child: Center(child: Text(title, style: textStyle)),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final double? fontSize;
  final EdgeInsets? padding;
  final double? radius;
  final Function onTap;
  final Color bgColor;
  final double elevation;
  final Color fgColor;
  final Color pressedColor;
  final Widget icon;
  final double borderWidth;
  final Color borderColor;
  final Size? size;
  final bool shrink;

  const CustomIconButton(
      {Key? key,
        required this.icon,
        this.radius,
        this.borderWidth = 0,
        this.borderColor = Colors.transparent,
        this.padding,
        this.fontSize,
        required this.onTap,
        this.bgColor = MyColor.buttonColor,
        this.elevation = 0,
        this.pressedColor = MyColor.appTheme,
        this.size,
        this.shrink = true,
        this.fgColor = MyColor.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(),
      clipBehavior: Clip.antiAlias,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(bgColor),
        foregroundColor: MaterialStateProperty.all(fgColor),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        side: MaterialStateProperty.all(BorderSide(
            color: borderColor, style: BorderStyle.solid, width: borderWidth)),
        elevation: MaterialStateProperty.all(elevation),
        padding: MaterialStateProperty.all(
            padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 5)),
        overlayColor: MaterialStateProperty.all(pressedColor),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 30))),
        animationDuration: const Duration(milliseconds: 500),
        splashFactory: InkSplash.splashFactory,
        maximumSize: shrink
            ? null
            : MaterialStateProperty.all(
            size ?? (Utils.isTablet ? Size(120.w, 48.h) : Size(60.w, 48.h))),
        minimumSize: shrink
            ? null
            : MaterialStateProperty.all(
            size ?? (Utils.isTablet ? Size(120.w, 48.h) : Size(60.w, 48.h))),
        visualDensity: VisualDensity.standard,
        // padding: MaterialStateProperty.all(EdgeInsets.all(20)),
        // surfaceTintColor:  MaterialStateProperty.all(Colors.greenAccent)
      ),
      child: icon,
    );
  }
}

class CustomAccessButton extends StatelessWidget {
  const CustomAccessButton({Key? key,
    this.title,
    this.onPressed,
    this.height,
    this.elevation,
    this.borderRadius,
    this.color = MyColor.blackShade5,
    this.borderSide,
    this.textStyle,
    this.icon,
    this.hasIcon = false,
  }) : assert((hasIcon == true && icon != null) ||
      (hasIcon == false && icon == null)), super(key: key);

  final VoidCallback? onPressed;
  final double? height;
  final double? elevation;
  final double? borderRadius;
  final String? title;
  final Color color;
  final BorderSide? borderSide;
  final TextStyle? textStyle;
  final Widget? icon;
  final bool hasIcon;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      elevation: elevation ?? Sizes.ELEVATION_1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? Sizes.RADIUS_24),
        side: borderSide ?? Borders.defaultPrimaryBorder,
      ),

      height: height ?? Sizes.HEIGHT_50,
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          hasIcon ? icon! : Container(),
          hasIcon ? const SpaceW8() : Container(),
          title != null
              ? Text(
            title!,
            style: textStyle,
          )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

