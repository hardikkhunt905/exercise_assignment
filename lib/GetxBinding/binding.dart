import 'package:exercise_assignment/Ui/Exercise_Detail/Controller/exercise_detail_controller.dart';
import 'package:exercise_assignment/Ui/Home/Controller/home_controller.dart';
import 'package:exercise_assignment/Ui/Splash/Controller/splash_screen_controller.dart';
import 'package:get/get.dart';


class Binding extends Bindings {
  @override 
  void dependencies() { 
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ExerciseDetailController());
    // Get.put(() => HomeController());
  }
}