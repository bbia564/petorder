import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pet_shop_manager/tools/color_tool.dart';
import 'package:pet_shop_manager/tools/componets.dart';

class PSAmountTextInputFormatter extends TextInputFormatter {
  final RegExp _exp = RegExp(r'^\d{0,5}(\.\d{0,1})?$');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (_exp.hasMatch(newValue.text)) {
      return newValue;
    }
    return oldValue;
  }
}

class CMDialog extends StatelessWidget {
  final String title;
  final String contentStr;
  final Function() okAction;
  final Function()? cancleAction;
  const CMDialog(
      {super.key,
      this.cancleAction,
      required this.okAction,
      required this.title,
      required this.contentStr});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: pmGetContainer(
            radius: 10.w,
            width: 300.w,
            height: 176.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                14.verticalSpace,
                pmGetText(title, fontSize: 14),
                13.verticalSpace,
                pmGetText(contentStr),
                20.verticalSpace,
                Divider(
                  color: PMColorUitl.pmGetColor("#EFEFEF"),
                ),
                SizedBox(
                  height: 46.h,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: InkWell(
                          onTap: Get.back,
                          child: Container(
                            alignment: Alignment.center,
                            child: pmGetText("Cancel",
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      pmGetContainer(
                        height: 30.h,
                        width: 1,
                        color: PMColorUitl.pmGetColor("#EFEFEF"),
                      ),
                      Flexible(
                          flex: 1,
                          child: InkWell(
                            onTap: okAction,
                            child: Container(
                              alignment: Alignment.center,
                              child: pmGetText("Ok",
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          )),
                    ],
                  ),
                )
              ],
            )));
  }
}

class PSInputDialog extends StatelessWidget {
  final Function(String value) okAction;
  final Function()? cancleAction;
  const PSInputDialog({
    super.key,
    this.cancleAction,
    required this.okAction,
  });

  @override
  Widget build(BuildContext context) {
    String inputstr = "";
    return Material(
        color: Colors.transparent,
        child: pmGetContainer(
            radius: 10.w,
            width: 300.w,
            height: 200.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                14.verticalSpace,
                pmGetText("结束订单", fontSize: 14),
                2.verticalSpace,
                pmGetText("输入实际金额", fontSize: 14),
                20.verticalSpace,
                pmGetContainer(
                    radius: 4.w,
                    height: 44.h,
                    width: double.infinity,
                    borderColor: PMColorUitl.pmGetColor("#EFEFEF"),
                    child:TextField(
                            keyboardType: const TextInputType.numberWithOptions(
                                decimal: true),
                            inputFormatters: [PSAmountTextInputFormatter()],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: PMColorUitl.pmGetColor("#454545"),
                                fontSize: 16.sp),
                            decoration: InputDecoration(
                                counterText: "",
                                border: InputBorder.none,
                                hintText: '输入',
                                hintStyle: TextStyle(
                                    color: PMColorUitl.pmGetColor('#9D9D9D'),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.normal)),
                            onChanged: (value) {
                              inputstr = value;
                            })),
                10.verticalSpace,
                Divider(
                  color: PMColorUitl.pmGetColor("#EFEFEF"),
                ),
                SizedBox(
                  height: 46.h,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: InkWell(
                          onTap: Get.back,
                          child: Container(
                            alignment: Alignment.center,
                            child: pmGetText("取消",
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      pmGetContainer(
                        height: 30.h,
                        width: 1,
                        color: PMColorUitl.pmGetColor("#EFEFEF"),
                      ),
                      Flexible(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              okAction(inputstr);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: pmGetText("确定",
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          )),
                    ],
                  ),
                )
              ],
            )));
  }
}
