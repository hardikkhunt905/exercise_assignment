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
        boxShadow: [BoxShadow(blurRadius: blurRadius, color: color ?? MyColor.appTheme),
        ]);
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
