import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_shop_manager/app/assets/assets.dart';
import 'package:pet_shop_manager/tools/baseview.dart';
import 'package:pet_shop_manager/tools/color_tool.dart';
import 'package:pet_shop_manager/tools/componets.dart';
import '../controllers/mine_page_controller.dart';

class MinePageView extends PSBaseView<MinePageController> {
  const MinePageView({super.key});

  @override
  Widget contentViewBuild(BuildContext context) {
    final titles = [ "Version", "Clear"];
    return pmGetContainer(
        radius: 10.w,
        padding: EdgeInsets.all(20.w),
        margin:
            EdgeInsets.fromLTRB(16.w, MediaQuery.of(context).padding.top, 16.w, 16.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            pmGetText("Settings",
                fontSize: 18, textColor: PMColorUitl.pmGetColor("#0F0F0F")),
            18.verticalSpace,
            pmDivider(),
            ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      controller.cellClick(index);
                    },
                    child: SizedBox(
                    height: 44.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        pmGetText(titles[index],
                            fontSize: 14, fontWeight: FontWeight.w400),
                        Image.asset(
                          Assets.arrowRight,
                          height: 14.w,
                          width: 14.w,
                        )
                      ],
                    ),
                  ),
                  );
                },
                separatorBuilder: (context, index) => pmDivider(),
                itemCount: 2)
          ],
        ));
  }
}
