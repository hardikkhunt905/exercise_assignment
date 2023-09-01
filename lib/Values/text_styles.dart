part of 'values.dart';

class TextStyles{

  static final textStyle = TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w500);

  //theme
  static final titleTextStyle = TextStyle(color:MyColor.white,fontWeight: FontWeight.w500,fontSize: 22.sp,fontFamily: uiFontFamily) ;
  static final buttonTextStyle = TextStyle(color:MyColor.white,fontWeight: FontWeight.w500,fontSize: 16.sp,fontFamily: uiFontFamily) ;
  static final headline1 = TextStyle(color:MyColor.white,fontWeight: FontWeight.w600,fontSize: 22.sp,fontFamily: uiFontFamily);
  static final headline2 = TextStyle(color:MyColor.white,fontWeight: FontWeight.w500,fontSize: 20.sp,fontFamily: uiFontFamily);
  static final bodyText2 = TextStyle(color:MyColor.white,fontWeight: FontWeight.w400,fontSize: 16.sp,fontFamily: uiFontFamily);
  static final bodyText1 = TextStyle(color:MyColor.white,fontWeight: FontWeight.w400,fontSize: 18.sp,fontFamily: uiFontFamily);
  static final subtitle1 = TextStyle(color:MyColor.white,fontWeight: FontWeight.w400,fontSize: 20.sp,fontFamily: uiFontFamily);

  //signUp text Style

  static final signUpTitleTextStyle = titleTextStyle.copyWith(color:MyColor.white,fontWeight: FontWeight.w700,fontSize: 22.sp,fontFamily: uiFontFamily) ;

  static final profileTitleStyle = TextStyle(color:MyColor.appTheme,fontWeight: FontWeight.w600,fontSize: Sizes.TEXT_SIZE_16,fontFamily: uiFontFamily);


  static final _lightScreenHeading1TextStyle = TextStyle(fontSize: 26.0.sp,fontWeight:FontWeight.bold, color: MyColor.black,fontFamily: uiFontFamily);

  static final darkScreenHeading1TextStyle = _lightScreenHeading1TextStyle.copyWith(color: MyColor.white);
}