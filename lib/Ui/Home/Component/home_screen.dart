import 'package:exercise_assignment/Constants/Extensions/extensions.dart';
import 'package:exercise_assignment/Constants/Utils/common_widgets.dart';
import 'package:exercise_assignment/Models/ExerciseData/exercise_data.dart';
import 'package:exercise_assignment/Values/values.dart';
import 'package:flutter/material.dart';
import 'package:exercise_assignment/Elements/Widgets/toast.dart';
import 'package:exercise_assignment/Ui/Home/Controller/home_controller.dart';
import 'package:get/get.dart';
import '../../../Constants/Utils/utils.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _logic = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return WillPopScope(
      onWillPop: Utils.onWillPop,
      child: Scaffold(
        body: _bodyWidget(),
      ),
    );
  }

  Widget _bodyWidget() {
    return Obx(() {
      return Stack(
        children: [
          CustomScrollView(
            slivers: [_appBar(), _listWidget()],
          ),
          _logic.isLoading.value ? Utils.showLoader() : const SizedBox.shrink()
        ],
      );
    });
  }

  SliverAppBar _appBar() {
    return SliverAppBar(
      centerTitle: true,
      pinned: true,
      expandedHeight: Sizes.HEIGHT_130,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          MyString.exercise,
          style:
              TextStyles.titleTextStyle.copyWith(fontSize: Sizes.TEXT_SIZE_16),
          textAlign: TextAlign.center,
        ),
        background: ColorFiltered(
            colorFilter: ColorFilter.mode(
                MyColor.appTheme.withOpacity(0.6), BlendMode.darken),
            child: Image.asset(
              ImagePath.exerciseBgImage,
              fit: BoxFit.cover,
            )),
      ),
    );
  }

  SliverPadding _listWidget() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
          horizontal: Sizes.WIDTH_10, vertical: Sizes.HEIGHT_10),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: _logic.exerciseList.length,
          (BuildContext context, int index) {
            ExerciseData data = _logic.exerciseList[index];
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Sizes.WIDTH_10, vertical: Sizes.HEIGHT_10),
              child: Container(
                padding: EdgeInsets.all(Sizes.WIDTH_10),
                child: Stack(
                  children: [
                    CommonWidgets.shimmerWidget(
                      child: Container(
                        decoration: Decorations.borderDecoration(
                            radius: Sizes.WIDTH_10, color: MyColor.appTheme),
                        height: Sizes.WIDTH_300,
                        width: Sizes.WIDTH_300,
                      ),
                    ),
                    _bgImage(data: data),
                    _listItemWidget(data: data)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _bgImage({required ExerciseData data}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Sizes.WIDTH_10),
      child: ColorFiltered(
          colorFilter: ColorFilter.mode(
              MyColor.appTheme.withOpacity(0.6), BlendMode.darken),
          child: Image.network(
            data.gifUrl,
            errorBuilder: (context, error, stackTrace) =>
                Image.asset(ImagePath.exerciseBgImage),
            height: Sizes.WIDTH_300,
            width: Sizes.WIDTH_300,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return CommonWidgets.shimmerWidget();
              }
            },
          )),
    );
  }

  Widget _listItemWidget({required ExerciseData data}) {
    return SizedBox(
      height: Sizes.WIDTH_300,
      width: Sizes.WIDTH_300,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Sizes.WIDTH_6, vertical: Sizes.WIDTH_10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "${data.bodyPart.toCamelCaseString()} ${MyString.exercise}",
                        style: TextStyles.headline2),
                    Text("for ${data.target.toCamelCaseString()}",
                        style: TextStyles.headline2),
                  ],
                ),
                Expanded(
                    child: Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: Text(
                          "${MyString.target.toCamelCaseString()} ${data.target}",
                          style: TextStyles.bodyText2
                              .copyWith(overflow: TextOverflow.ellipsis),
                        ))),
              ],
            ),
            const Spacer(),
            Align(
                alignment: AlignmentDirectional.bottomStart,
                child: Text(
                    "${MyString.equipment} : ${data.equipment.toCamelCaseString()}",
                    style: TextStyles.bodyText2)),
          ],
        ),
      ),
    );
  }
}
