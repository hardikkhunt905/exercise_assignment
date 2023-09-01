import 'package:exercise_assignment/Ui/Splash/Controller/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:exercise_assignment/Elements/Widgets/toast.dart';
import 'package:exercise_assignment/Values/values.dart';
import 'package:get/get.dart';
import '../../../Constants/constants.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final _logic = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
        body:
        Center(
          child: FadeTransition(
            opacity: _logic.animation,
            child: Image.asset(
              ImagePath.appLogo,
              width : screenWidth/1.2,
            )),
        ),
        );
  }
}
