part of 'values.dart';

class Styles {
  // static TextStyle customTextStyle({
  //   Color color = MyColor.blackShade3,
  //   FontWeight fontWeight = FontWeight.w600,
  //   double fontSize = Sizes.TEXT_SIZE_14,
  //   FontStyle fontStyle: FontStyle.normal,
  // }) {
  //   return TextStyle(
  //     fontSize: fontSize,
  //     color: color,
  //     fontWeight: fontWeight,
  //     fontStyle: fontStyle,
  //       fontFamily: "Poppins"
  //   );
  // }

  static TextStyle customTextStyle2({
    Color color = MyColor.blackShade7,
    FontWeight fontWeight = FontWeight.w600,
    double? fontSize,
    FontStyle fontStyle = FontStyle.normal,
  }) {
    return TextStyle(
      fontSize: fontSize ?? Sizes.TEXT_SIZE_16,
      color: color,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      fontFamily: "Roboto"
    );
  }
}
