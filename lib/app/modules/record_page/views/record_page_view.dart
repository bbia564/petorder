import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pet_shop_manager/app/modules/record_page/views/record_cell.dart';
import 'package:pet_shop_manager/tools/baseview.dart';
import 'package:pet_shop_manager/tools/color_tool.dart';
import 'package:pet_shop_manager/tools/componets.dart';
import '../controllers/record_page_controller.dart';

class RecordPageView extends PSBaseView<RecordPageController> {
  const RecordPageView({super.key});

  @override
  RecordPageController get controller => Get.put(RecordPageController());

  @override
  Widget contentViewBuild(BuildContext context) {
    return pmGetContainer(
        radius: 10.w,
        padding: EdgeInsets.all(20.w),
        margin:
            EdgeInsets.fromLTRB(16.w, MediaQuery.of(context).padding.top, 16.w, 16.h),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  pmGetText("Order List",
                      fontSize: 18,
                      textColor: PMColorUitl.pmGetColor("#0F0F0F")),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      showMyMenu(context);
                    },
                    child: pmGetContainer(
                        key: controller.globleKey,
                        radius: 4.w,
                        height: 42.h,
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        alignment: Alignment.center,
                        borderColor: PMColorUitl.pmGetColor("#D0D0D0"),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            10.horizontalSpace,
                            Obx(() => pmGetText(controller.type.value,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                textColor: PMColorUitl.pmGetColor("#0F0F0F"))),
                            10.horizontalSpace,
                            Icon(
                              Icons.arrow_drop_down,
                              color: PMColorUitl.pmGetColor("#0F0F0F"),
                            )
                          ],
                        )),
                  ),
                  10.verticalSpace,
                ],
              ),
              10.verticalSpace,
              Obx(() => controller.datasource.isEmpty
                  ? Padding(
                      padding: EdgeInsets.only(top: 150.h),
                      child: Center(
                        child: pmGetText("No data yet",
                            fontSize: 12,
                            textColor: PMColorUitl.pmGetColor("#999999")),
                      ),
                    )
                  : Expanded(child: ListView.builder(
                      itemCount: controller.datasource.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        final model = controller.datasource[index];
                        return RecordCell(model: model);
                      },
                    )))
            ]));
  }

  void showMyMenu(BuildContext context) async {
    final RenderBox renderBox =
        controller.globleKey.currentContext!.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final String? selectedValue = await showMenu(
      color: Colors.white,
      context: context,
      position: RelativeRect.fromLTRB(
          offset.dx, offset.dy + renderBox.size.height, offset.dx, offset.dy),
      items: [
        const PopupMenuItem<String>(
          value: 'All',
          child: Text('All'),
        ),
        const PopupMenuItem<String>(
          value: 'Finished',
          child: Text('Finished'),
        ),
        const PopupMenuItem<String>(
          value: 'UnFinish',
          child: Text('UnFinish'),
        ),
      ],
      elevation: 8.0,
    );

    if (selectedValue != null) {
      controller.type.value = selectedValue;
      controller.filterData();
    }
  }
}
