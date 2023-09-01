import 'package:exercise_assignment/Constants/constants.dart';
import 'package:exercise_assignment/Ui/Exercise_Detail/Controller/exercise_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Constants/Utils/common_widgets.dart';
import '../../../Constants/Utils/utils.dart';
import '../../../Elements/Widgets/toast.dart';
import '../../../Values/values.dart';

class ExerciseDetailScreen extends StatelessWidget {
  ExerciseDetailScreen({super.key});

  final _logic = Get.put(ExerciseDetailController());

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      body: _bodyWidget(),
    );
  }

  Widget _bodyWidget() {
    return CustomScrollView(
      slivers: [
        CommonWidgets.appBar(title: _logic.exerciseData.name),
        //GetBuilder not needed it can be done with obx here because nothing in this screen is restating but for differences i am using it
        GetBuilder<ExerciseDetailController>(builder: (logic) {
          if (_logic.isLoading) {
            return SliverToBoxAdapter(
                child: SizedBox(
                    height: screenHeightOrg / 1.5, child: Utils.showLoader()));
          } else {
            return _detailsWidget();
          }
        })
      ],
    );
  }

  SliverPadding _detailsWidget() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
          horizontal: Sizes.WIDTH_10, vertical: Sizes.HEIGHT_10),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          CommonWidgets.bgImage(
              imagePath: _logic.exerciseData.gifUrl,
              height: screenHeightOrg / 2,
              isColorFilter: false),
          detail(title: MyString.bodyPart, detail: _logic.exerciseData.bodyPart),
          detail(title: MyString.equipment, detail: _logic.exerciseData.equipment),
          detail(title: MyString.target, detail: _logic.exerciseData.target),
        ]),
      ),
    );
  }

  Widget detail({required String title, required String detail}) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
          horizontal: Sizes.WIDTH_10, vertical: Sizes.HEIGHT_10),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Sizes.WIDTH_10, vertical: Sizes.HEIGHT_10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(Sizes.WIDTH_10),
              child: Text(
                "$title :",
                style: TextStyles.detailTitleStyle,
              ),
            ),
            Expanded(
                child: Align(alignment: AlignmentDirectional.centerEnd,
                  child: Text(
              detail,
              style: TextStyles.detailSubTitleStyle,
            ),
                )),
          ],
        ),
      ),
    );
  }
}
