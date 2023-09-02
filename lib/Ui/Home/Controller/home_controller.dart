import 'package:exercise_assignment/Constants/Utils/app_urls.dart';
import 'package:exercise_assignment/Constants/Utils/utils.dart';
import 'package:exercise_assignment/Constants/constants.dart';
import 'package:exercise_assignment/Routing/routes.dart';
import 'package:exercise_assignment/Services/http_service.dart';
import 'package:get/get.dart';
import '../../../Models/ExerciseData/exercise_data.dart';

class HomeController extends GetxController {
  HttpService services = HttpService();
  RxBool isLoading = false.obs;
  List<ExerciseData> exerciseList = [];
  int visibleItemCount = 0;

  @override
  void onInit() async {
    super.onInit();
    await Utils.checkInternet(
        onPositiveClick: () async => await getExerciseData());
  }

  Future<void> getExerciseData() async {
    isLoading.value = true;
    try {
      var response = await services.getRequest(AppUrls.getExercises);
      if (Utils.checkResponse(statusCode: response.statusCode)) {
        List list = response.data;
        exerciseList = list.map((e) => ExerciseData.fromJson(e)).toList();
        visibleItemCount = 10;
        Debug.setLog("here is response --> $exerciseList");
        update();
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      Debug.setLog("Error getting getExerciseData --> ${e.toString()}");
    }
  }

  Future<void> onListItemTab({required ExerciseData data}) async{
    await Get.toNamed(Routes.exerciseDetailScreen,arguments: {exerciseDataArg : data});
  }

  void loadMoreItem() async{
    await Future.delayed(const Duration(seconds: 1),() => visibleItemCount+=10);
    update();
  }

}
