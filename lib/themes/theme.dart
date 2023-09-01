import 'package:flutter/material.dart';
import 'package:exercise_assignment/Values/values.dart';

import '../Constants/constants.dart';

class CustomThemes{

  static final lightTheme = ThemeData(
    fontFamily: uiFontFamily,
    textTheme: _textTheme,
      appBarTheme:  AppBarTheme(
        titleTextStyle: TextStyles.titleTextStyle,
        color: MyColor.appTheme,
        // iconTheme: IconThemeData(color: _lightOnPrimaryColor),
      ),
      primarySwatch: MaterialColor(0xFFC39BD3, MyColor.materialAppTheme),
      colorScheme: ThemeData().colorScheme.copyWith(
        primary: MyColor.black,
      ),
      inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(color: MyColor.darkGray)),
      scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(MyColor.gray),
          trackColor: MaterialStateProperty.all(Colors.transparent),
          trackBorderColor: MaterialStateProperty.all(Colors.transparent)));


  static final TextTheme _textTheme = TextTheme(
    headline1: TextStyles.headline1,
    headline2: TextStyles.headline2,
    bodyText1: TextStyles.bodyText1,
    bodyText2: TextStyles.bodyText2,
    subtitle1: TextStyles.subtitle1,
  );


  /* Dark Theme */

  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: MyColor.lightBlack,
      appBarTheme: const AppBarTheme(
        color: MyColor.black,
        iconTheme: IconThemeData(color: MyColor.white),
      ),
      colorScheme: const ColorScheme.dark(
        primary: MyColor.darkGray,
        primaryContainer: MyColor.black,
        secondary: MyColor.white,
        onPrimary: MyColor.white,
        background: MyColor.darkGray,
      ),
      // iconTheme: IconThemeData(
      //   color: _iconColor,
      // ),
      textTheme: _darkTextTheme,
      dividerTheme: const DividerThemeData(
          color: MyColor.black
      )  );

  static final TextTheme _darkTextTheme = TextTheme(headline1: TextStyles.darkScreenHeading1TextStyle);


}

