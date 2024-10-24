import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_shop_manager/app/modules/record_page/controllers/record_page_controller.dart';
import 'package:pet_shop_manager/tools/pas_db.dart';
import 'package:pet_shop_manager/tools/recordmode.dart';

class AddRecordPageController extends GetxController {
  final nameControl = TextEditingController();
  final ageControl = TextEditingController();
  final amountControl = TextEditingController();
  final contanctControl = TextEditingController();

  final String typeName = Get.arguments["title"];

  final isMale = true.obs;
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
    ageControl.dispose();
    nameControl.dispose();
    amountControl.dispose();
    contanctControl.dispose();

    super.onClose();
  }

  void add_commit() async {
    if (nameControl.text.isEmpty) {
      BotToast.showText(text: "Please input pet name");
      return;
    } else if (ageControl.text.isEmpty) {
      BotToast.showText(text: "Please input pet age");
      return;
    } else if (amountControl.text.isEmpty) {
      BotToast.showText(text: "Please input price");
      return;
    } else if (!contanctControl.text.isPhoneNumber) {
      BotToast.showText(text: "Please input right contact");
      return;
    }

    final newModel = PSRecordModel();
    newModel.type = typeName;
    newModel.amount = double.parse(amountControl.text);
    newModel.petName = nameControl.text;
    newModel.petAge = int.parse(ageControl.text);
    newModel.phone = contanctControl.text;
    newModel.finished = 0;
    newModel.iconname = Get.arguments["iconname"];
    newModel.createTime = DateTime.now().millisecondsSinceEpoch;

    final cancel = BotToast.showLoading();
    await PSDatabaseTool().insetPetManagerRecord(newModel);
    if (Get.isRegistered<RecordPageController>()) {
      final vc = Get.find<RecordPageController>();
      vc.refreshDatas();
    }

    cancel();
    Get.back(result: true);
  }
}
