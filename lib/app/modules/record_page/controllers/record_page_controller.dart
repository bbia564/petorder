import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_shop_manager/tools/pas_db.dart';
import 'package:pet_shop_manager/tools/recordmode.dart';

class RecordPageController extends GetxController {
  final type = "All".obs;

  final datasource = <PSRecordModel>[].obs;
  var allDatas = <PSRecordModel>[];
  final GlobalKey globleKey = GlobalKey();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    refreshDatas();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void toFinished(PSRecordModel item) async {
  
    await PSDatabaseTool().update(item);
    refreshDatas();
  }

  void resetDatas() async {
    type.value = "All";
    allDatas = [];
    datasource.value = [];
  }

  void filterData() {
    final list = <PSRecordModel>[];
    if (type.value == "All") {
      datasource.value = allDatas;
      return;
    } else if (type.value == "Finished") {
      for (var element in allDatas) {
        if (element.isFinish) {
          list.add(element);
        }
      }
    } else if (type.value == "UnFinish") {
      for (var element in allDatas) {
        if (!element.isFinish) {
          list.add(element);
        }
      }
    }
    datasource.value = list;
  }

  void refreshDatas() async {
    allDatas = await PSDatabaseTool().getAllRecords();
    filterData();
  }
}
