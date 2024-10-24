import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_shop_manager/app/modules/record_page/controllers/record_page_controller.dart';
import 'package:pet_shop_manager/tools/ce_dialog.dart';
import 'package:pet_shop_manager/tools/pas_db.dart';

class MinePageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void cellClick(int index) async {
    if (index == 1) {
      showclearAleart();
    }else{
      showVersionAleart();
    }
  }

  void showclearAleart() {
    Get.dialog(Center(
      child: CMDialog(
        title: "Tips",
        contentStr: "Are you sure to clear all records",
        okAction: cleanDatas,
      ),
    ));
  }

  void showVersionAleart() {
    Get.dialog(Center(
      child: CMDialog(
        title: "Version",
        contentStr: "V1.0.0",
        okAction: Get.back,
      ),
    ));
  }

  void cleanDatas() async {
    await PSDatabaseTool().clean();
    if (Get.isRegistered<RecordPageController>()) {
      Get.find<RecordPageController>().resetDatas();
    }
    BotToast.showText(text: "Clear Success");
  }
}
