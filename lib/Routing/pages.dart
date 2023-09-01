import 'package:exercise_assignment/Routing/routes.dart';
import 'package:get/get.dart';

import '../Ui/Home/Component/home_screen.dart';

class Pages {
  static final pages = [
    GetPage(name: Routes.homeScreen, page: () => HomeScreen(), popGesture: false,transition: Transition.fadeIn),
    // GetPage(name: Routes.homeScreen, page: () => AdDemoScreen(), popGesture: false),
  ];
}
