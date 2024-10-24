import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pet_shop_manager/app/assets/assets.dart';
import 'package:pet_shop_manager/tools/color_tool.dart';
import 'package:pet_shop_manager/tools/componets.dart';

abstract class PSBaseView<T extends GetxController> extends GetView<T> {
  const PSBaseView({super.key});

 String getBackgroundName() {
    return Assets.backgroundNopet;
  }

  Widget _buildBgView() {
    return Positioned(
      top: 0,
      child: Image.asset(
      getBackgroundName(),
      height: 320.h,
      width: 1.sw,
      fit: BoxFit.fitWidth,
    ));
  }

  bool showTitleView() {
    return false;
  }
  Widget contentViewBuild(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: Stack(
          fit: StackFit.expand,
      children: [
        _buildBgView(),
        showTitleView() ?  Positioned(
          top: 80.h,
          left: 27.w,
          child: pmGetText("pet-shop\nmanage",fontSize: 26,textColor: PMColorUitl.pmGetColor("#454545")),
        ) : const SizedBox(),
        Positioned(
          top: kMinInteractiveDimension,
          bottom: 0,
          right: 0,
          left: 0,
          child: contentViewBuild(context),
        ),
      ],
    ));
  }
}
