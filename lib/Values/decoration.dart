part of 'values.dart';

class Decorations {

  static customBoxDecoration({
    double blurRadius = 5,
    Color color = const Color(0xFFD6D7FB),
  }) {
    return BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: blurRadius, color: color)]);
  }

  static appBarTitleBoxDecoration({
    double blurRadius = 5,
    Color? color,
  }) {
    return BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: blurRadius,
              offset: Offset(0, 4),spreadRadius: 0.5,
              color: color ?? MyColor.appTheme.withOpacity(0.5)),
          BoxShadow(
              blurRadius: blurRadius,
              offset: Offset(0, 4),spreadRadius: 0.5,
              color: color ?? MyColor.appTheme.withOpacity(0.5)),
        ],
      borderRadius: BorderRadius.circular(Sizes.RADIUS_4),
      // color: MyColor.appTheme
    );

  }


  static borderDecoration({
    double? radius,
    double? borderWidth,
    Color? color,
    Color? borderColor,
  }) {
    return BoxDecoration(color: color,
      borderRadius: BorderRadius.circular(radius ?? Sizes.RADIUS_4),
      border: Border.all(color: borderColor ?? MyColor.transparent,width: borderWidth ?? Sizes.WIDTH_4)
      // color: MyColor.appTheme
    );

  }


  static exitDialogBoxDecoration({
    double blurRadius = 5,
    Color color = const Color(0xFFD6D7FB),
    BoxShape shape = BoxShape.rectangle,
    BorderRadiusGeometry? borderRadius,
  }) {
    return BoxDecoration(
        color: color,
        shape: shape,
        borderRadius: borderRadius
    );
  }



}
