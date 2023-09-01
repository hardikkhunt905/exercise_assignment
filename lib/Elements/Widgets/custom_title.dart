import 'package:flutter/material.dart';
import 'package:exercise_assignment/Constants/Utils/utils.dart';
import 'package:exercise_assignment/Elements/Widgets/custom_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTitle extends StatelessWidget {

  final String title;
  final double? fontSize;
  final Color? fontColor;
  final FontWeight? fontWeight;

  const CustomTitle({Key? key,required this.title, this.fontSize,this.fontColor,this.fontWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tempSize = fontSize ?? (Utils.isTablet ? 12.sp : 20.sp);

    return Text(title,
              style: CustomStyles.textStyle(
                  fontSize: tempSize,
                  fontColor: fontColor ?? Colors.white,
                  fontWeight: fontWeight ?? FontWeight.bold
              )
              //TextStyle(color: uiColors.title, fontSize:  animate ?? false ? size.value : tempsize),
              );
  }
}
