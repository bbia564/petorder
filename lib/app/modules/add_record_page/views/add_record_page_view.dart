import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:pet_shop_manager/app/assets/assets.dart';
import 'package:pet_shop_manager/tools/ce_dialog.dart';
import 'package:pet_shop_manager/tools/color_tool.dart';
import 'package:pet_shop_manager/tools/componets.dart';

import '../controllers/add_record_page_controller.dart';

class AddRecordPageView extends GetView<AddRecordPageController> {
  const AddRecordPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: pmGetText(controller.typeName),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: pmGetContainer(
            radius: 10.w,
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                _inputView("Pet name",
                    inputController: controller.nameControl, maxLength: 10),
                _chooseGender(),
                _inputView("Pet age",
                    inputController: controller.ageControl,
                    keyboardType: TextInputType.number,
                    maxLength: 3),
                _inputView("Advance payment",
                    inputController: controller.amountControl,
                    inputFormatters: [PSAmountTextInputFormatter()],
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true)),
                _inputView("Contact",
                    inputController: controller.contanctControl,
                    keyboardType: TextInputType.phone,
                    maxLength: 11),
                35.verticalSpace,
                InkWell(
                  onTap: controller.add_commit,
                  child: pmGetContainer(
                      radius: 6.w,
                      height: 44.w,
                      color: PMColorUitl.pmGetColor("#FF7D27"),
                      alignment: Alignment.center,
                      child: pmGetText("Submit", textColor: Colors.white)),
                ),
                4.verticalSpace
              ],
            )),
      ),
    );
  }

  Widget _inputView(String title,
      {List<TextInputFormatter>? inputFormatters,
      TextEditingController? inputController,
      TextInputType? keyboardType = TextInputType.name,
      int? maxLength}) {
    return pmGetContainer(
        radius: 6.w,
        height: 52.h,
        margin: EdgeInsets.only(bottom: 10.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        borderColor: PMColorUitl.pmGetColor("#D0D0D0"),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            pmGetText(title, fontSize: 14, fontWeight: FontWeight.w400),
            Expanded(
                child: TextField(
                    maxLength: maxLength,
                    controller: inputController,
                    keyboardType: keyboardType,
                    inputFormatters: inputFormatters,
                    textAlign: TextAlign.right,
                    style: TextStyle(color: PMColorUitl.pmGetColor("#454545"), fontSize: 16.sp),
                    decoration: InputDecoration(
                        counterText: "",
                        border: InputBorder.none,
                        hintText: 'input',
                        hintStyle: TextStyle(
                            color: PMColorUitl.pmGetColor('#9D9D9D'),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal)),
                    onChanged: (value) {})),
            10.horizontalSpace,
          ],
        ));
  }

  Widget _chooseGender() {
    return pmGetContainer(
        radius: 6.w,
        height: 52.h,
        margin: EdgeInsets.only(bottom: 10.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        borderColor: PMColorUitl.pmGetColor("#D0D0D0"),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            pmGetText("Pet gender", fontSize: 14, fontWeight: FontWeight.w400),
            const Spacer(),
            InkWell(
              onTap: () {
                controller.isMale.value = true;
              },
              child: Obx(() => Image.asset(
                    controller.isMale.isTrue
                        ? Assets.petGenderSelect
                        : Assets.petGenderNormal,
                    height: 16.w,
                    width: 16.w,
                  )),
            ),
            3.horizontalSpace,
            Obx(
              () => pmGetText("Male",
                  fontSize: 14,
                  textColor: controller.isMale.isTrue
                      ? PMColorUitl.pmGetColor("#FF7D27")
                      : PMColorUitl.pmGetColor("#898989")),
            ),
            30.horizontalSpace,
            InkWell(
              onTap: () {
                controller.isMale.value = false;
              },
              child: Obx(() => Image.asset(
                    controller.isMale.isFalse
                        ? Assets.petGenderSelect
                        : Assets.petGenderNormal,
                    height: 16.w,
                    width: 16.w,
                  )),
            ),
            3.horizontalSpace,
            Obx(
              () => pmGetText("Famale",
                  fontSize: 14,
                  textColor: controller.isMale.isFalse
                      ? PMColorUitl.pmGetColor("#FF7D27")
                      : PMColorUitl.pmGetColor("#898989")),
            )
          ],
        ));
  }
}


