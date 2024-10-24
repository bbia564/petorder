import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_shop_manager/app/assets/assets.dart';
import 'package:pet_shop_manager/app/modules/home/views/homeCell.dart';

import 'package:pet_shop_manager/tools/baseview.dart';

import '../controllers/home_controller.dart';

class HomeView extends PSBaseView<HomeController> {
  const HomeView({super.key});

  @override
  String getBackgroundName() {
    return Assets.backgound;
  }

  @override
  Widget contentViewBuild(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          (80 + kBottomNavigationBarHeight).verticalSpace,
          ...controller.listModels.map((e) => HomeCell(model: e))
        ],
      ),
    );
  }

  @override
  bool showTitleView() {
    return true;
  }

  @override
  String viewTitle() {
    return "";
  }
}
