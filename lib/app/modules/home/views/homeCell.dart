import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pet_shop_manager/tools/color_tool.dart';
import 'package:pet_shop_manager/tools/componets.dart';

class HomeCell extends StatelessWidget {
  final Map<String, String> model;
  const HomeCell({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/add-record-page',arguments: {"title":model["title"],"iconname":model["img"]});
      },
      child: pmGetContainer(
        radius: 10.w,
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              model["img"]!,
              height: 46.h,
              width: 46.w,
            ),
            18.horizontalSpace,
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                pmGetText(model["title"]!, fontSize: 14),
                4.verticalSpace,
                pmGetText(model["subTitle"]!,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    textColor: PMColorUitl.pmGetColor("#9B9B9B")),
              ],
            )
          ],
        )),
    );
  }
}
