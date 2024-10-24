import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pet_shop_manager/app/modules/record_page/controllers/record_page_controller.dart';
import 'package:pet_shop_manager/tools/ce_dialog.dart';
import 'package:pet_shop_manager/tools/color_tool.dart';
import 'package:pet_shop_manager/tools/componets.dart';
import 'package:pet_shop_manager/tools/recordmode.dart';

class RecordCell extends StatelessWidget {
  final PSRecordModel model;
  const RecordCell({super.key, required this.model});

  void showToFinishedDialog() {
    Get.dialog(Center(
      child: PSInputDialog(okAction: (str) {
        if (str.isEmpty) {
          BotToast.showText(text: "Please enter the actual amount");
        } else {
          model.finished = 1;
          model.realAmount = str;
          toFinished();
        }
      }),
    ));
  }

  void toFinished() {
    Get.back();
    final vc = Get.find<RecordPageController>();
    vc.toFinished(model);
  }

  @override
  Widget build(BuildContext context) {
    return pmGetContainer(
        radius: 10.w,
        margin: EdgeInsets.only(bottom: 10.h),
        color: PMColorUitl.pmGetColor("#FCFCFC"),
        borderColor: PMColorUitl.pmGetColor("#EAEAEA"),
        padding: EdgeInsets.all(12.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Image.asset(
                  model.iconname ?? "-",
                  height: 24.h,
                  width: 24.h,
                ),
                6.horizontalSpace,
                pmGetText(model.type ?? "-"),
                const Spacer(),
                pmGetText(
                    model.isFinish
                        ? "Consumption:${model.amount?.toStringAsFixed(2)}"
                        : "Precharge:${model.amount?.toStringAsFixed(2)}",
                    fontSize: 12,
                    textColor: model.isFinish
                        ? PMColorUitl.pmGetColor("#A2A2A2")
                        : PMColorUitl.pmGetColor("#FF7D27"))
              ],
            ),
            12.verticalSpace,
            pmDivider(),
            12.verticalSpace,
            Row(
              children: [
                pmGetText("Name: ",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    textColor: PMColorUitl.pmGetColor("#6E6E6E")),
                pmGetText(model.petName ?? "-", fontSize: 12),
                const Spacer(),
                pmGetText("Age: ",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    textColor: PMColorUitl.pmGetColor("#6E6E6E")),
                pmGetText("${model.petAge}", fontSize: 12),
                const Spacer(),
              ],
            ),
            10.verticalSpace,
            Row(
              children: [
                pmGetText("Contact: ",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    textColor: PMColorUitl.pmGetColor("#6E6E6E")),
                pmGetText(model.phone ?? "-", fontSize: 12),
                const Spacer(),
                model.isFinish
                    ? pmGetContainer(
                        radius: 4.w,
                        width: 82.w,
                        height: 30.h,
                        alignment: Alignment.center,
                        color: PMColorUitl.pmGetColor("#E8E8E8"),
                        child: pmGetText("Finished",
                            fontSize: 12,
                            textColor: PMColorUitl.pmGetColor("#939393")))
                    : InkWell(
                        onTap: showToFinishedDialog,
                        child: pmGetContainer(
                            radius: 4.w,
                            width: 82.w,
                            height: 30.h,
                            alignment: Alignment.center,
                            color: PMColorUitl.pmGetColor("#FF7D27"),
                            child: pmGetText("Finish",
                                fontSize: 12, textColor: Colors.white)),
                      )
              ],
            )
          ],
        ));
  }
}
