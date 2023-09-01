import 'package:flutter/material.dart';
import 'package:exercise_assignment/Values/values.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key,
    this.width ,
    this.height,
    this.color = MyColor.white,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Sizes.WIDTH_80,
      height: height ?? Sizes.HEIGHT_1,
      color: color,
    );
  }
}
