import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:exercise_assignment/Elements/Widgets/custom_styles.dart';

class CustomText extends StatelessWidget {

  const CustomText({Key? key, required this.text, this.color,this.fontWeight,this.fontSize}) : super(key: key);

  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CustomStyles.textStyle(
        fontSize: fontSize,
        fontColor: color,
        fontWeight: fontWeight
      ),
    );
  }
}
