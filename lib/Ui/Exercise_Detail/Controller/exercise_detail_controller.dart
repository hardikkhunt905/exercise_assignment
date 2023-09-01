import 'package:exercise_assignment/Constants/constants.dart';
import 'package:exercise_assignment/Models/ExerciseData/exercise_data.dart';
import 'package:get/get.dart';

import '../../../Constants/Utils/app_urls.dart';
import '../../../Constants/Utils/utils.dart';
import '../../../Services/http_service.dart';

class ExerciseDetailController extends GetxController {
  HttpService services = HttpService();
  bool isLoading = false;
  ExerciseData exerciseData = ExerciseData();

  @override
  void onInit() async {
    super.onInit();
    try {
      exerciseData = Get.arguments[exerciseDataArg];
    } catch (e) {
      Debug.setLog("can't get exercise Data ->${e.toString()}");
    }
    await Utils.checkInternet(
        onPositiveClick: () async => await getExerciseData());
  }

  Future<void> getExerciseData() async {
    isLoading = true;
    try {
      var response = await services
          .getRequest(AppUrls.getExerciseDetail + exerciseData.id);
      if (Utils.checkResponse(statusCode: response.statusCode)) {
        exerciseData = ExerciseData.fromJson(response.data);
        Debug.setLog("here is response --> ${exerciseData.toJson()}");
      }
      isLoading = false;
    } catch (e) {
      isLoading = false;
      Debug.setLog("Error getting getExerciseData --> ${e.toString()}");
    }
    update();
  }
}
