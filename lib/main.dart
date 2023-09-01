import 'package:exercise_assignment/Values/values.dart';
import 'package:flutter/material.dart';
import 'package:exercise_assignment/Constants/constants.dart';
import 'package:exercise_assignment/Constants/Utils/utils.dart';
import 'package:exercise_assignment/GetxBinding/binding.dart';
import 'package:exercise_assignment/Localization/Translations/translations.dart';
import 'package:exercise_assignment/Routing/pages.dart';
import 'package:exercise_assignment/Ui/Splash/Component/splash_screen.dart';
import 'package:exercise_assignment/themes/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (BuildContext context, Widget? homeChild) {
        return ValueListenableBuilder(
          valueListenable: Utils.appLocal,
          builder: (BuildContext context,Locale value, Widget? child) {
            return GetMaterialApp(
              initialBinding: Binding(),
              navigatorKey: navigatorKey,
              scrollBehavior: MyCustomScrollBehavior(),
              title: MyString.appName,
              //theme
              theme:Get.isDarkMode ? CustomThemes.darkTheme : CustomThemes.lightTheme,
              home: homeChild,
              getPages: Pages.pages,
              onInit: (){
                Get.width > 450 ? Utils.isTablet = true : Utils.isTablet = false;
                Debug.setLog('is tablate : ${Utils.isTablet}');
              },
              debugShowCheckedModeBanner: false,
              defaultTransition: Transition.cupertino,
              //translation
              translationsKeys: AppTranslation.translationsKeys,
              locale: value,
              fallbackLocale: const Locale('en', 'US'),
            );
          },
        );
      },
      child: SplashScreen(),
    );
  }

}
