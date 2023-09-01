import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Routing/routes.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin{

  late final AnimationController animationController = AnimationController(
    duration: const Duration(milliseconds: 5000),
    vsync: this,
  )..repeat(reverse: false);
  late final Animation<double> animation = CurvedAnimation(
    parent: animationController,
    curve: Curves.easeIn,
  );


  @override
  void onInit() async{
    super.onInit();
    await _toHomeScreen();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  _toHomeScreen() async{
    await Future.delayed(const Duration(seconds: 5), () => Get.offNamed(Routes.homeScreen));
  }

}