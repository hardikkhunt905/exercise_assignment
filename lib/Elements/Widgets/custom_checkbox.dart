// import 'package:flutter/material.dart';
// import 'package:exercise_assignment/Constants/Extensions/extensions.dart';
// import 'package:exercise_assignment/themes/my_color.dart';
//
// class CustomCheckBox extends StatelessWidget {
//   const CustomCheckBox({Key? key, required this.temp, required this.onChnage,
//     this.scale,this.fgColor,this.bgColor,this.borderColor,this.shape,this.radius}) : super(key: key);
//
//   final bool temp;
//   final Function(bool) onChnage;
//   final double? scale;
//   final double? radius;
//   final Color? bgColor;
//   final Color? fgColor;
//   final Color? borderColor;
//   final OutlinedBorder? shape;
//
//   @override
//   Widget build(BuildContext context) {
//     late final value = temp;
//     return Checkbox(
//       value: value,
//       onChanged: (val) {
//         value.value = val ?? false;
//         onChnage(val ?? value.value);
//       },
//       splashRadius: 5.w,
//       visualDensity: VisualDensity.compact,
//       materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//       shape: shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius ?? 5)),
//       side: BorderSide(color:  borderColor ??  MyColor.blue, width: 2),
//       fillColor: MaterialStateProperty.all(bgColor ?? MyColor.buttonColor),
//       checkColor: fgColor,
//       overlayColor: MaterialStateProperty.all(MyColor.blue.withOpacity(0.1)),
//     );
//
//
//   }
// }
