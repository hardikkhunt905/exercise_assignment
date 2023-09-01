import 'package:exercise_assignment/Values/values.dart';
import 'package:flutter/material.dart';
import 'package:exercise_assignment/Constants/Utils/utils.dart';
import 'package:exercise_assignment/Elements/Widgets/spaces.dart';
import 'package:exercise_assignment/Elements/Widgets/toast.dart';
import 'package:exercise_assignment/Ui/Home/Controller/home_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _logic = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(MyString.appName,style: TextStyles.subtitle1,),
      // ),
      body: _bodyWidget(),
    );
  }

  Widget _bodyWidget(){
    return CustomScrollView(
      slivers: [
        SliverAppBar(centerTitle: true,
          pinned: true,
          expandedHeight: Sizes.HEIGHT_130,
          flexibleSpace: LayoutBuilder(
            builder: (context, constraints)  {
              final bool isExpanded = constraints.maxHeight > Sizes.HEIGHT_130;
              return FlexibleSpaceBar(centerTitle: true,
                title: Container(decoration: isExpanded ? Decorations.customBoxDecoration() : null,
                    child: Text(MyString.exercise,style: TextStyles.subtitle1)),
                background: Image.asset(ImagePath.exerciseBgImage,fit: BoxFit.cover,),
              );
            }
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 20,
                (BuildContext context, int index) {
              return Container(
                color: index.isOdd ? MyColor.white : MyColor.blackShade3,
                height: Sizes.HEIGHT_100,
                child: Center(
                  child: Text('$index', textScaleFactor: 5),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
